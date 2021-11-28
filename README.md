# README

## userテーブル
|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false, unique: true|
|email              |string |null: false, unique: true|
|password           |string |null: false              |
|encrypted_password |string |null: false              |
|name               |string |null: false              |
|name_hurigana      |string |null: false              |
|birthday           |string |null: false              |

### Association
- has_many :users
- has_many :purchases
- has_many :addresses

## goodsテーブル
|Column         |Type   |Options                       |
|---------------|-------|------------------------------|
|goods_name     |string |null: false                   |
|goods_image    |string |null: false                   |
|goods_category |string |null: false                   |
|goods_status   |text   |null: false                   |
|goods_price    |string |null: false                   |
|goods_payment  |string |null: false                   |
|goods_area     |string |null: false                   |
|goods_delivery |string |null: false                   |
|user           |string |null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase
- has_one :address

## purchaseテーブル
|Column|Type|Options|
|-----------|-------|-----------------------------|
|user       |string |null: false, foregn_key: true|
|goods      |string |null: false, foregn_key: true|

### Association
- belongs_to :user
- belongs_to :goods

## addressテーブル
|Column|Type|Options|
|--------------|-------|-----------------------------|
|user          |string |null: false, foregn_key: true|
|user_address  |string |null: false                  |

### Association
- belongs_to :user
- belongs_to :goods
- belongs_to ::address