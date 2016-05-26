# class ImageUploader < CarrierWave::Uploader::Base

#   include Cloudinary::CarrierWave
#   storage :fog
  
#   process :convert => 'png'
#   process :tags => ['post_picture']
  
#   version :standard do
#     process :eager => true
#     process :resize_to_fill => [100, 150, :north]
#   end
  
#   version :thumbnail do
#     eager
#     resize_to_fit(50, 50)
#   end

#   def public_id
#     return model.short_name
#   end  

# end