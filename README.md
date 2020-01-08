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
|status        |integer  |null: false|
|delivery_type |integer  |null: false|
|postage       |integer  |null: false|
|region        |integer  |null: false|
|shipping_date |integer  |null: false|
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
- belongs_to :item


## categoriesテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|ancestry      |string   |
|name          |string   |null: false|
### Association 
- has_many :items
- has_ancestry

### Option
・ancestry をgemでインストールする。


## creditsテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|card_number   |integer  |null: false|
|card_month    |integer  |null: false|
|card_year     |integer  |null: false|
|security_code |integer  |null: false|
|user          |integer  |null: false, foreign_key:true|

### Association
- belongs_to :user







