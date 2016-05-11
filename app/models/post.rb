class Post < ActiveRecord::Base
  belongs_to :trip
 	include Paperclip::Glue
end
