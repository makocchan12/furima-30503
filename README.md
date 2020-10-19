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
- has_many :credit_cards

## items テーブル
| Column                | Type       | Options                       |
| -------------------   | ---------- | -----------                   |
| image                 | text       |                               |
| name                  | string     | null: false                   |
| description           | text       | null: false                   |
| category              | integer    | null: false                   |
| condition             | integer    | null: false                   |
| shipping_charge_payer | integer    | null: false                   |
| prefecture            | integer    | null: false                   |
| day_required          | integer    | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false  foreign_key: true| 


### Association

- belongs_to :user
- has_one :credit_card
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge_payer 
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :day_required


## credit_cards テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item          | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |
| card_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| credit_card   | integer    | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :item_purchase