class Product < ApplicationRecord
  has_many :orders
  has_many :users, :through => :orders

  mount_uploader :image, ImageUploader
 end
