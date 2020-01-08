## usersテーブル
|Column         |Type     |Options                   |
|---------------|---------|---------------           |
|nickname       |string   |null: false, unique: true, index: true
|email          |string   |null: false, unique: true
|password       |string   |null: false
|last_name      |string   |null: false
|first_name     |string   |null: false
|last_name_kana |string   |null: false
|first_name_kana|string   |null: false
|birthday_info  |date     |null: false
|icon           |string
|introduction   |text
|proceed        |integer  |null: false

### Association
- has_many :buyed_items, foreign_key: “buyer_id”, class_name: “Item”
  has_many :saling_items, -> { where(“buyer_id is NULL”) }, foreign_key: “saler_id”, class_name: “Item”
  has_many :sold_items, -> { where(“buyer_id is not NULL”) }, foreign_key: “saler_id”, class_name: “Item”
## itemsテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|id            |string   |null: false|
|name          |string   |null: false, index: true|
|explanation   |string   |null: false|
|image         |string   |null: false|
|status        |string   |null: false|
|postage       |string   |null: false|
|region        |string   |null: false|
|shipping_date |string   |null: false|
|category      |string   |null: false|
|price         |integer  |null: false|
|brand         |string   |
|saler_id      |reference|null: false, foreign_key: true|
|buyer_id      |reference|null: false, foreign_key: true|
### Association  
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"

## imagesテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|image         |string   |null: false|
|item_id       |reference|null: false, foreign_key: true|
### Association 
- belongs_to :items


## categoriesテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|name          |string   |null: false|
### Association 
- has_many :second_categories
- belongs_to :items 


## second_categoriesテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|name          |string   |null: false|
|parent_id     |integer  |null: false, foreign_key: true|
### Association 
- belongs_to :categories
- has_many :third_categories

## third_categories3テーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|name          |string   |null: false|
|parent_id     |integer  |null: false, foreign_key: true|
### Association 
- belongs_to :second_categories






