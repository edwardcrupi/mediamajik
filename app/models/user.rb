class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :images
    has_many :galleries
	has_and_belongs_to_many :shared_images, :class_name => "Image", :join_table => "images_users"
	has_and_belongs_to_many :shared_galleries, :class_name => "Gallery", :join_table => "galleries_users"

end
