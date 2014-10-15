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
	end

end
