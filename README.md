# README

# ＜FURIMA＞

## ●DB設計

### usersテーブル ※gem deviseを利用する
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, default: ""|  ※devise導入時に自動生成
|encrypted_password,|string|null: false, default: ""|             ※devise導入時に自動生成
|user_family_name,|string|null: false|            
|user_first_name,|string|null: false|         
|user_family_name_kana,|string|null: false|          
|user_first_name_kana,|string|null: false|            
|birth,|date|null: false|            

#### Association
- has_many :items, dependent: :destroy
- has_one :profile
- has_many :comments
- has_many :creditcards
- has_one :location
- has_many :likes, dependent: :destroy
- has_many :like_items, through: :likes, source: :item
- has_many :sns_credentials

<!-- ------------------------------------- -->

### profileテーブル
|Column|Type|Options|
|------|----|-------|
|introduction|text| - |
|user_image|string| - |
|user_id|bigint|foreign_key:true|

#### Association
belongs_to :user

<!-- ------------------------------------- -->

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key:true, type: :integer|
|item_purchaser_id|bigint|foreign_key:true|
|category_id|bigint|foreign_key:true|
|brand_name|string| - |
|item_name|string|null: false|
|description|text|null: false|
|price|string|null: false||
|size|string| - |
|condition|string|null: false|
|shipping_fee_payer|string|null: false|
|prefecture_id|string|null: false|
|shipping_days|string|null: false|
|likes_count|integer| - |

#### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- belongs_to :category, dependent: :destroy, optional: true
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user

<!-- ------------------------------------- -->

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key:true|
|item_id|bigint|foreign_key:true|
|content|text|null: false|

#### bAssociation
belongs_to :item
belongs_to :user

<!-- ------------------------------------- -->

### imagesモデル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|bigint|foreign_key:true|

#### Association
- belongs_to :item

<!-- ------------------------------------- -->

### categoriesテーブル  ※gem ancestryを使う
|Column|Type|Options|
|------|----|-------|
|name|string|| ※
|ancestry|string|| ※

▼modelに以下を記述
has_ancestry

#### Association
- has_many :items
- has_ancestry

<!-- ------------------------------------- -->

### creditcardsテーブル  ※gem 'payjp'を使う
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

#### Association
belongs_to :user

<!-- ------------------------------------- -->

### locationテーブル  ※配送先
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key:true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|building_name|string| - |
|phone_name|integer| - |

#### Association
belongs_to :user, optional: true

<!-- ------------------------------------- -->

### prefecturesテーブル
|Column|Type|Options|
|------|----|-------|

#### Association

<!-- ------------------------------------- -->

### sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|-------|
|uid|string|-------|
|user_id|bigint|foreign_key: true|

#### Association
- belongs_to :user, optional: true

<!-- ------------------------------------- -->

### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key:true|
|item_id|bigint|foreign_key:true|

#### Association
- belongs_to :item, counter_cache: :likes_count
- belongs_to :user

## ●開発環境  
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code/HAML/SCSS/JavaScript/jQuery

## ●アプリについて
フリーマーケットのアプリケーション 
!<img width="1417" alt="スクリーンショット 2020-03-30 13 38 55" src="https://user-images.githubusercontent.com/60685829/77877729-8ecf5c00-7291-11ea-921e-83d0ccc8b2a5.png" width="450px" height="600px">

## ●開発担当箇所
-商品出品ページ（フロントエンド）  
![85ecbdcadf2246d64306b06e21271326](https://user-images.githubusercontent.com/60685829/77879536-9bee4a00-7295-11ea-9dc0-711ae762b8ad.gif)
