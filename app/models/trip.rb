class Trip < ActiveRecord::Base
	validates_presence_of :title
	belongs_to :user
	has_many :posts, dependent: :destroy
  has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover_image, content_type: "image/jpeg", "image/gif", "image/png"]