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

| Colum           | Type   | Options     |
|-----------------|--------|-------------|
| nick_name       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
-has_many :items
-has_many :purchases


## Itemsテーブル

| Colum           | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipment_source | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| price           | integer    | null: false                    |
*imageはActiveStorageで実装する。

### Association
-belongs_to :user
-has_one :purchase


## Purchasesテーブル

| Colum                         | Type       | Options                        |
|-------------------------------|------------|--------------------------------|
| user                          | references | null: false, foreign_key: true |
| item                          | references | null: false, foreign_key: true |
| card_number                   | integer    | null: false                    |
| card_expiration_year          | integer    | null: false                    |
| card_expiration_month         | integer    | null: false                    |
| card_security_code            | integer    | null: false                    |
| shipping_postal_code          | string     | null: false                    |
| shipping_address_prefecture   | string     | null: false                    |
| shipping_address_municipality | string     | null: false                    |
| shipping_address_number       | string     | null: false                    |
| shipping_address_building     | string     | null: true                     |
| shipping_phone_number         | integer    | null: false                    |

### Association
-belongs_to :user
-belongs_to :item