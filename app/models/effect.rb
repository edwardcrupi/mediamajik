class Effect < ActiveRecord::Base
	has_and_belongs_to_many :images

	def add_effect

	end
end
