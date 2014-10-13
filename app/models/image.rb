class Image < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :galleries
	has_paper_trail

	mount_uploader :image, ImageUploader

	def dimensions
		img = Magick::Image::read("#{Rails.root}/public"+image_url(:image).to_s).first
		self.width  = img.columns
		self.height = img.rows
		self.save
	end

end
