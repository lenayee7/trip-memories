class Trip < ActiveRecord::Base
	validates_presence_of :title
	belongs_to :user
	has_many :posts, dependent: :destroy
end