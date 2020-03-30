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
<img width="1417" alt="スクリーンショット 2020-03-30 13 38 55" src="https://user-images.githubusercontent.com/60685829/77877729-8ecf5c00-7291-11ea-921e-83d0ccc8b2a5.png">

## ●開発担当箇所
-商品出品ページ（フロントエンド）  
![a6659ef020f78db867b931a184f5aafe](https://user-images.githubusercontent.com/60685829/77884153-7e25e280-729f-11ea-840e-d9225187900a.gif)<br>
<br>
-クレジットカード登録ページ（フロントエンド）
<img width="799" alt="スクリーンショット 2020-03-28 17 18 25" src="https://user-images.githubusercontent.com/60685829/77884476-1f149d80-72a0-11ea-94c0-cb82ad8b6e88.png"><br>
<br>
-商品詳細画像複数表示（フロントエンド）
![d2d367292430cb516b813f3f634c9f37](https://user-images.githubusercontent.com/60685829/77885241-a31b5500-72a1-11ea-9a04-16f84561a734.gif)<br>
<br>
-トップページ/新着投稿一覧表示（バックエンド）<br>
<br>
-お気に入り機能（バックエンド）<br>
![b724053548145ff739d6bcc01ef8b3ca](https://user-images.githubusercontent.com/60685829/77886004-0c4f9800-72a3-11ea-9a14-4bd25f9b08d8.gif)


