class Gallery < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :images
	has_many :effects

	def add_image(image)
		self.images << image
	end

	def remove_image(image)
		self.images.delete(image)
	end
end
