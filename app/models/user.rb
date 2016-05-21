class User < ActiveRecord::Base
  has_many :trips
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "20x20>" }, default_url: "https://s3.amazonaws.com/trip-memories/whale.jpg"
  validates :email, uniqueness: true
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
                  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end
