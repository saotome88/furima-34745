# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Usersテーブル
| Colum              | Type   | Options                   |
|--------------------|--------|---------------------------|
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
-has_many :items
-has_many :purchases


## Itemsテーブル
| Colum              | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
*imageはActiveStorageで実装する。

### Association
-belongs_to :user
-has_one :purchase


## Purchasesテーブル
| Colum       | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :item
-has_one :buyer


## Buyersテーブル
| Colum                         | Type       | Options                        |
|-------------------------------|------------|--------------------------------|
| purchase                      | references | null: false, foreign_key: true |
| shipping_postal_code          | string     | null: false                    |
| prefecture_id                 | integer    | null: false                    |
| shipping_address_municipality | string     | null: false                    |
| shipping_address_number       | string     | null: false                    |
| shipping_address_building     | string     |                                |
| shipping_phone_number         | string     | null: false                    |
※クレジットカード情報はpayjpにて管理する。

### Association
-belongs_to :purchase