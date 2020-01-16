class Item < ApplicationRecord

  belongs_to :saler, class_name: "User" ,optional: true
  belongs_to :buyer, class_name: "User",optional: true
  belongs_to :category,optional: true
  has_many :images
  
end
