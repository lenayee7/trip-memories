class Trip < ActiveRecord::Base
	validates_presence_of :title
	belongs_to :user
	has_many :posts, dependent: :destroy
  has_uploadcare_file :cover_image

  # has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :cover_image, 
  #                                   :content_type => /^image\/(png|gif|jpeg)/,
  #                                   :message => 'only (png/gif/jpeg) images'
end