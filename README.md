# summary
- フリマアプリのクローンサイト
## URL
フリマアプリ：http://54.250.198.16/
フォーク先のリポジトリ：https://github.com/manbo1123/freemarket_sample_65d.git

## Basic認証
ID：admin
Pass：65dfurima

## テスト用アカウント
### 購入者用
メールアドレス：seller@co.jp
パスワード：1234567

### 購入用カード情報
番号：4242424242424242
期限：1 / 22
セキュリティカード：123

### 出品者用
メールアドレス：buyer@co.jp
パスワード：1234567

# Functions
- ユーザー新規登録・ログイン/ログアウト機能・SNS連携
- 商品出品・購入
- カテゴリー・ブランド機能
- クレジットカード登録・支払い機能
- マイページ機能・編集

# ER diagram
![Alt text](https://gyazo.com/ad9fc0a3f2b807bc30f971900b22b584/raw)

# users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|password|string|null:false|
|email|string|null:false, unique: true, index:true|

## Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :todo_lists
- has_many :user_evaluations
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :point
- has_one :profile, dependent: :destroy
- has_one :sns_authentication, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy


# profiles table
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|
|introduction|text||
|avatar|string||
|user|references|null: false, foreign_key: true|

## Association
- belongs_to :user


# sns_authentications table
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false, unique: true|
|token|text||
|user|references|null: false, foreign_key: true|

## Association
- belongs_to :user


# sending_destinations table
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_name|string||
|phone_number|integer| unique: true|
|user|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- Gem：jp_prefectureを使用して都道府県コードを取得

# credit_cards table
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user|references|null: false, foreign_key: true|

## Association
- belongs_to:user


# todo_lists table
|Column|Type|Options|
|------|----|-------|
|list|text|null:false|
|user|references|null: false, foreign_key: true|

## Association
- belongs_to:user


# points table
|Column|Type|Options|
|------|----|-------|
|point|integer||
|user|references|null: false, foreign_key: true|

## Association
- belongs_to:user

# user_evaluations table
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|

## Association
- belongs_to_active_hash :evaluation
- belongs_to :user
- belongs_to :item


# items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|item_condition|references|null: false,foreign_key: true|
|postage_payer|references|null: false,foreign_key: true|
|prefecture_code|integer|null: false|
|size|references|null: false, foreign_key: true|
|preparation_day|references|null: false, foreign_key: true|
|postage_type|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp||

## Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_imgs, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_type
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- Gem：jp_prefectureを使用して都道府県コードを取得


# brands table
|Column|Type|Options|
|------|----|-------|
|name|string||

## Association
- has_many :items


# item_imgs table
|Column|Type|Options|
|------|----|-------|
|src|string|null:false|
|item|references|null: false, foreign_key: true|

## Association
- belongs_to :item


# favorites table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :item

# comments table
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|created_at|timestamp|null: false|

## Association
- belongs_to :user
- belongs_to :item


# categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||

## Association
- has_many :items
