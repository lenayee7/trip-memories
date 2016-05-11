class Post < ActiveRecord::Base
  belongs_to :trip, dependent: :destroy
 	include Paperclip::Glue
end
