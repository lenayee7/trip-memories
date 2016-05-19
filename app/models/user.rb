class User < ActiveRecord::Base
  has_many :trips
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/slade1.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end
