class Image < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_and_belongs_to_many :galleries
	has_many :effects
	has_many :child_versions, :class_name => "Image"
	belongs_to :parent_image, :class_name => "Image", :foreign_key => "image_id"
	belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
	has_paper_trail

	mount_uploader :image, ImageUploader
	before_save :set_dimensions

	validates :title, :caption, presence: true

	def set_dimensions
		img = Magick::Image::read("#{Rails.root}/public"+image_url(:image).to_s).first
		self.width  = img.columns
		self.height = img.rows
		self.size 	= img.filesize
		if self.v.nil? then self.v = 0 end
		self.url 	= img.filename
	end

	def apply_effect effect
		image_url = "#{Rails.root}/public"+image_url(:image).to_s
		img = Magick::Image::read(image_url).first
		case effect.effect_type
		when "Brightness"
			img = img.modulate(effect.amount, 1, 1)
		when "Saturation"
			img = img.modulate(1, effect.amount, 1)
		when "Hue"
			img = img.modulate(1, 1, effect.amount)
		when "Contrast"			
		end
		self.v = self.v + 1
		temp =  image_url(:image).to_s.scan(/(.+)\.([A-Za-z0-9]*)$/).flatten
		i = Image.create(image: self.image, owner: self.owner, parent_image: self, caption: self.caption, title: self.title, v: self.v)
		self.child_versions << i
		i.child_versions = []
		i.save!
		self.parent_image = nil
		image_url = "#{temp[0]}_#{self.v}.#{temp[1]}"
		src = File.join(Rails.root, 'public', image_url)
		img.write(src)
		src_file = File.new(src)
		self.image = src_file
		self.image.recreate_versions!
	end

	def make_current
		self.parent_image = nil
	end

	def add_child_to image
	end

	def root_version?
		return self.parent_image.nil?
	end

	def leaf_version?
		return self.child_versions.empty?
	end

	def in_trash?
		return self.in_trash
	end

end
