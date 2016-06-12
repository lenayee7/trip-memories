class Post < ActiveRecord::Base
	validates :title, presence: true
  belongs_to :trip
  has_attached_file :image, :source_file_options =>  {:all => '-auto-orient'}, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3.amazonaws.com/trip-memories/jusgotravel.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
