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

- has_many :orders_address
- has_many :items
- belongs_to :order_detail

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
| user         | references | NOT NULL |

### Association

- belongs_to :user
- has_many :orders_address
- belongs_to :order_detail


## orders_address テーブル

| Column         | Type       | Options  |
| -------------- | -------    | -------- |
| postal_code    | string     | NOT NULL |
| prefecture_id  | integer    | NOT NULL |
| municipalities | string     | NOT NULL |
| address        | string     | NOT NULL |
| building       | string     |          |
| phone          | string     | NOT NULL |
| orders_detail | references  | NOT NULL |

### Association

- belongs_to :user
- has_many :items
- belongs_to :order_detail

## orders_details

| Column   | Type       | Options  |
|          | ---------- | -------- |
| items    | references | NOT NULL |
| order    | references | NOT NULL |
| user     | references | NOT NULL |

### Association

- has_one :user
- has_one :item
- has_one :order_address