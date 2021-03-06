# README

 # テーブル設計

## users テーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル
| Column                   | Type       | Options                       |
| -------------------      | ---------- | -----------                   |
| name                     | string     | null: false                   |
| description              | text       | null: false                   |
| category_id              | integer    | null: false                   |
| condition_id             | integer    | null: false                   |
| shipping_charge_payer_id | integer    | null: false                   |
| prefecture_id            | integer    | null: false                   |
| day_required_id          | integer    | null: false                   |
| price                    | integer    | null: false                   |
| user                     | references | null: false, foreign_key: true| 


### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge_payer 
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :day_required


## purchases テーブル
| Column        | Type       |  Options                        |
| ------------- | -------    | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :purchase