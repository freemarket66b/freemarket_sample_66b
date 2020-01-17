class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :saler, class_name: "User" 
  belongs_to :buyer, class_name: "User",optional: true
  belongs_to :category,optional: true
  has_many :images
  
end
