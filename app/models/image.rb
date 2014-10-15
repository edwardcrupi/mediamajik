class Image < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_and_belongs_to_many :galleries
	has_many :effects
	belongs_to :owner, :class_name => "User", :foreign_key =>"user_id"

	has_paper_trail

	mount_uploader :image, ImageUploader
	before_save :set_dimensions

	def set_dimensions
		img = Magick::Image::read("#{Rails.root}/public"+image_url(:image).to_s).first
		self.width  = img.columns
		self.height = img.rows
		self.size 	= img.filesize
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
		img.write(img.filename)
		load = ImageUploader.new
		load.store!(img)
	end

end
