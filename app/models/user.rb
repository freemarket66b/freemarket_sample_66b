class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable  
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday_info, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

end
