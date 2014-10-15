class Effect < ActiveRecord::Base
	has_and_belongs_to_many :images
	has_paper_trail

	mount_uploader :image, ImageUploader

	def add_effect image, effect, amount
		image = Magick::Image::read("#{Rails.root}/public"+image_url(:image).to_s).first
		image.modulate(0,0,0)
	end
end
