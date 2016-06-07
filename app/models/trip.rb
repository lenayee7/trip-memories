class Trip < ActiveRecord::Base
  
  # geocoded_by :location
  # after_validation :geocode
  
	validates_presence_of :title
	belongs_to :user
	has_many :posts, dependent: :destroy
  has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/suncloud.jpg"
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\Z/
end