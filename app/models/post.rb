class Post < ActiveRecord::Base
	validates :title, presence: true
  belongs_to :trip

  has_uploadcare_file :image
  # has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
end
