class Effect < ActiveRecord::Base
	has_and_belongs_to_many :images
	has_paper_trail

	#mount_uploader :image, ImageUploader

	validates :effect_type, :amount, presence: true
 	validates :amount, numericality: { only_integer: false, greater_than: 0}
 	
	before_save :set_amounts

	#Calls this before every save
	def set_amounts
		case self.effect_type
		when "Brightness"
			unless self.brightness.nil? then self.brightness = self.brightness + amount else
				self.brightness = 1 end
		when "Saturation"
			unless self.saturation.nil? then self.saturation = self.saturation + amount else
				self.saturation = 1 end
		when "Hue"
			unless self.hue.nil? 		then self.hue 		 = self.hue + amount else
				self.hue = 1 end
		when "Contrast"
			unless self.contrast.nil? 	then self.contrast   = self.contrast + amount else
				self.contrast = 1 end
		end
	end

end
