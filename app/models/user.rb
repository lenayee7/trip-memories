class User < ActiveRecord::Base
  has_many :trips
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3.amazonaws.com/trip-memories/whale.jpg"
  validates :email, uniqueness: true
  validates_attachment :avatar,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_attached_file :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end
