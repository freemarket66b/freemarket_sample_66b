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
|birth_year     |integer  |null: false
|birth_month    |integer  |null: false
|birth_day      |integer  |null: false
|credit         |references|foreign_key: true|
|sns_credentials_id|intger|null: false, foreign_key: true
|icon           |string
|introduction   |text


### Association
- has_many :buyed_items, foreign_key: “buyer_id”, class_name: “Item”
  has_many :saling_items, -> { where(“buyer_id is NULL”) }, foreign_key: “saler_id”, class_name: “Item”
  has_many :sold_items, -> { where(“buyer_id is not NULL”) }, foreign_key: “saler_id”, class_name: “Item”
- belongs_to :address
- has_many :sns_credentials
- has_one :card


  ## addressesテーブル
|Column         |Type     |Options                   |
|---------------|---------|---------------           |
|postal-code    |integer   |null: false, unique: true, index: true
|prefectures    |string   |null: false, unique: true
|city           |string   |null: false
|town_number    |integer  |null: false
|building-name  |string   |null: false
|phone_number_delivery |integer|
|user           |integer  |null: false, foreign_key: true|

### Association 
- belongs_to :user

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
|category      |reference|null: false, foreign_key: true|
|saler_id      |reference|null: false, foreign_key: { to_tabele: :users}|
|buyer_id      |reference|null: false, foreign_key: { to_tabele: :users}|
### Association  
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :images
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


## cardテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|user_id       |integer  |null: false, foreign_key:true|
|card_id       |integer  |null: false, foreign_key:true|
|customer_id   |integer  |null: false, foreign_key:true|
|token         |integer  |null: false, foreign_key:true|
|user          |integer  |null: false, foreign_key:true|

### Association
- belongs_to :user

## sns_credentialテーブル
|Column        |Type     |Options    |
|--------------|---------|-----------|
|user_id       |integer  |null: false, foreign_key:true|
|provider      |integer  |null: false, foreign_key:true|
|uid           |integer  |null: false, foreign_key:true|

### Association
- belongs_to :user







