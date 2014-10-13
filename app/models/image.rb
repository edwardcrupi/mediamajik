class Image < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :galleries
	has_paper_trail

	mount_uploader :image, ImageUploader

end
