# README

## usersテーブル
|Column               |Type   |Options                  |
|---------------------|-------|-------------------------|
|nickname             |string |null: false              |
|email                |string |null: false, unique: true|
|encrypted_password   |string |null: false              |
|first_name           |string |null: false              |
|family_name          |string |null: false              |
|first_name_hurigana  |string |null: false              |
|family_name_hurigana |string |null: false              |
|birthday             |date   |null: false              |

### Association
- has_many :orders
- has_many :items
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
|prefectures    |integer|null: false                   |
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

## addressesテーブル
|Column           |Type   |Options                       |
|-----------------|-------|------------------------------|
|post_code        |string |null: false                   |
|prefectures      |integer|null: false                   |
|municipalitis    |string |null: false                   |
|address          |string |null: false                   |
|building_name    |string |                              |
|telephone_number |string |null: false                   |
|orders           |string |null: false, foreign_key: true|

### Association
- belongs_to :order