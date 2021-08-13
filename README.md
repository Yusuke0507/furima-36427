# テーブル設計

## users テーブル

| Column                     | Type    | Options                |
| -----------------          | ------- | ---------------------- |
| nickname                   | string  | NOT NULL               |
| email                      | string  | NOT NULL, unique: true |
| encrypted_password         | string  | NOT NULL               |
| first_name                 | string  | NOT NULL               |
| last_name                  | string  | NOT NULL               |
| first_name_kana            | string  | NOT NULL               |
| last_name_kana             | string  | NOT NULL               |
| birthday                   | date    | NOT NULL               |

### Association

- has_many :items
- has_many :order_details

## items テーブル

| Column          | Type       | Options                     |
| --------------- | ---------- | --------------------------- |
| name            | string     | NOT NULL                    |
| detail          | text       | NOT NULL                    |
| category_id     | integer    | NOT NULL                    |
| status_id       | integer    | NOT NULL                    |
| shipping_fee_id | integer    | NOT NULL                    |
| area_id         | integer    | NOT NULL                    |
| days_to_ship_id | integer    | NOT NULL                    |
| price           | integer    | NOT NULL                    |
| user            | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user
- has_one :order_detail


## order_addresses テーブル

| Column         | Type       | Options                     |
| -------------- | -------    | --------------------------- |
| postal_code    | string     | NOT NULL                    |
| prefecture_id  | integer    | NOT NULL                    |
| municipality   | string     | NOT NULL                    |
| address        | string     | NOT NULL                    |
| building       | string     |                             |
| phone          | string     | NOT NULL                    |
| order_detail  | references | foreign_key: true           |

### Association
- belongs_to :order_detail

## order_details

| Column   | Type       | Options                     |
|          | ---------- | --------------------------- |
| user     | references | NOT NULL, foreign_key: true |
| item     | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order_address