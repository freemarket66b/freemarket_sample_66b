
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
|bought_items   |reference|null: false, foreign_key: true
|selling_items  |reference|null: false, foreign_key: true
|sold_items     |reference|null: false, foreign_key: true
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
|saler_id      |reference|null: false, foreign_key: true|
|buyer_id      |reference|null: false, foreign_key: true|
### Association  
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"