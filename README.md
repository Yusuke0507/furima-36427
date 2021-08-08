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

- has_one :orders_address
- has_many :items
- has_one :order_detail

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


## orders_address テーブル

| Column         | Type       | Options                     |
| -------------- | -------    | --------------------------- |
| postal_code    | string     | NOT NULL                    |
| prefecture_id  | integer    | NOT NULL                    |
| municipalities | string     | NOT NULL                    |
| address        | string     | NOT NULL                    |
| building       | string     |                             |
| phone          | string     | NOT NULL                    |
| item           | string     | NOT NULL                    |

### Association

- belongs_to :user

## orders_detail

| Column   | Type       | Options                     |
|          | ---------- | --------------------------- |
| user     | references | NOT NULL, foreign_key: true |
| item     | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item