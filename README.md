# テーブル設計

## users テーブル

| Column                     | Type    | Options  |
| -----------------          | ------- | -------- |
| nickname                   | string  | NOT NULL |
| email                      | string  | NOT NULL |
| encrypted_password         | string  | NOT NULL |
| first_name                 | string  | NOT NULL |
| last_name                  | string  | NOT NULL |
| pseudonym_first            | string  | NOT NULL |
| pseudonym_last             | string  | NOT NULL |
| birthday                   | date    | NOT NULL |

### Association

- belongs_to :orders
- has_many :items

## items テーブル

| Column       | Type       | Options  |
| ------------ | ---------- | -------- |
| name         | string     | NOT NULL |
| detail       | text       | NOT NULL |
| category     | string     | NOT NULL |
| status       | string     | NOT NULL |
| shipping_fee | integer    | NOT NULL |
| days_to_ship | integer    | NOT NULL |
| price        | integer    | NOT NULL |
| user_id      | references | NOT NULL |
| order_id     | references | NOT NULL |

### Association

- belongs_to :users
- has_many :orders

## orders_address テーブル

| Column         | Type    | Options  |
| -------------- | ------- | -------- |
| postal_code    | integer | NOT NULL |
| prefectures    | string  | NOT NULL |
| municipalities | string  | NOT NULL |
| address        | string  | NOT NULL |
| building       | string  |          |
| phone          | integer | NOT NULL |

### Association

- belongs_to :user
- has_many :items

## orders_detail

| Column   | Type       | Options  |
|          | ---------- | -------- |
| items_id | references | NOT NULL |
| users_id | references | NOT NULL |

### Association

- has_one :user
- has_one :item