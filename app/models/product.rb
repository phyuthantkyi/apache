class Product < ApplicationRecord
  # to upload image 
  mount_uploader :image, ImageUploader
end
