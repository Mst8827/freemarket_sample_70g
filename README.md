# README

## usersテーブル ※gem deviseを利用する
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|  ※devise導入時に自動生成
|password|string|null: false|             ※devise導入時に自動生成

### Association
- has_many :items, dependent: :destroy
- has_one :profile
- has_many :comments
- has_one :credit_card
- has_one :location


## profileテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|introduction|text| - |
|user_image|string| - |
|user|references|foreign_key:true, type: :integer|

### Association
belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key:true, type: :integer|
|category|references|foreign_key:true, type: :integer|
|brand|references|foreign_key:true, type: :integer||
|item_name|string|null: false|
|description|text|null: false|
|price|string|null: false||
|size|string||
|condition|string|null: false|
|shipping_fee_payer|string|null: false|
|shipping_location|string|null: false|
|shipping_days|string|null: false|

### Association
- belongs_to :user
- has_many :images
- belongs_to :category
- belongs_to :brand
- has_many :comments


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key:true, type: :integer|
|item|references|foreign_key:true, type: :integer|
|content|text|null: false|

### bAssociation
belongs_to :item
belongs_to :user


## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :items


## imagesモデル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|foreign_key:true, type: :integer|

### Association
- belongs_to :item


## categoriesテーブル  ※gem ancestryを使う
|Column|Type|Options|
|------|----|-------|
|name|string|| ※
|ancestry|string|| ※

▼modelに以下を記述
has_ancestry

### Association
- has_many :items


## creditcardsテーブル  ※gem 'payjp'を使う
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key:true, type: :integer|
|number|integer|null: false|
|cvc|integer|null: false|
|exp_year|integer|null: false|
|exp_month|integer|null: false|
|amount|integer|null: false|                    #支払金額
|card|reference|foreign_key:true, type: :integer| #顧客ID
|currency|string|null: false|                   #通貨

### Association
belongs_to :user


## locationテーブル  ※配送先
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key:true, type: :integer|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building_name|string| |
|phone_number|integer| |

### Association
belongs_to :user