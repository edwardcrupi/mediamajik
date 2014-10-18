class Image < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_and_belongs_to_many :galleries
	has_many :effects
	belongs_to :owner, :class_name => "User", :foreign_key =>"user_id"
	#has_many :filters, -> {where "effect_type = 'filter'"}, through: :effects
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
	end

	def apply_effect effect
		image_url = "#{Rails.root}/public"+image_url(:thumb).to_s
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
		image_url = img.filename+self.v.to_s
		img.write(image_url)
		self.image = image_url
		load = ImageUploader.new
		load.store!(img)
	end

	def in_trash?
		return self.in_trash
	end

end
