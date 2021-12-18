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

## itemsテーブル
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|items_name     |string    |null: false                   |
|category_id    |integer   |null: false                   |
|status_id      |integer   |null: false                   |
|price_id       |integer   |null: false                   |
|payment_id     |integer   |null: false                   |
|prefectures_id |integer   |null: false                   |
|delivery_id    |integer   |null: false                   |
|user           |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
|Column     |Type       |Options                       |
|-----------|-----------|------------------------------|
|user       |references |null: false, foreign_key: true|
|item       |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|post_code        |string     |null: false                   |
|prefectures_id   |integer    |null: false                   |
|municipalitis    |string     |null: false                   |
|address          |string     |null: false                   |
|building_name    |string     |                              |
|telephone_number |string     |null: false                   |
|order            |references |null: false, foreign_key: true|

### Association
- belongs_to :order
