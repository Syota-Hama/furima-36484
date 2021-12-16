# README

## usersテーブル
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

## itemsテーブル
|Column         |Type   |Options                       |
|---------------|-------|------------------------------|
|items_name     |string |null: false                   |
|items_image    |string |null: false                   |
|items_category |string |null: false                   |
|items_status   |text   |null: false                   |
|items_price    |string |null: false                   |
|items_payment  |string |null: false                   |
|items_area     |string |null: false                   |
|items_delivery |string |null: false                   |
|users          |string |null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order
- has_one :address

## ordersテーブル
|Column     |Type   |Options                       |
|-----------|-------|------------------------------|
|users      |string |null: false, foreign_key: true|
|items      |string |null: false, foreign_key: true|
|addresses  |string |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## addressテーブル
|Column|Type|Options|
|-----------------|-------|-----------------------------|
|post_code        |string |null: false                  |
|prefectures      |string |null: false                  |
|municipalitis    |string |null: false                  |
|address          |string |null: false                  |
|building_name    |string |null: false                  |
|telephone_number |string |null: false                  |

### Association
- belongs_to :user
- belongs_to :goods
- belongs_to ::address