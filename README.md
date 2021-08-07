# テーブル設計

## users テーブル

| Column                     | Type    | Options  |
| -----------------          | ------- | -------- |
| nickname                   | string  | NOT NULL |
| email                      | string  | NOT NULL |
| encrypted_password         | string  | NOT NULL |
| encrypted_password_confirm | string  | NOT NULL |
| first_name                 | string  | NOT NULL |
| last_name                  | string  | NOT NULL |
| pseudonym(first)           | string  | NOT NULL |
| pseudonym(last)            | string  | NOT NULL |
| birthday                   | date    | NOT NULL |

### Association

- belongs_to :orders
- has_many :items

## items テーブル

| Column       | Type       | Options  |
| ------------ | ---------- | -------- |
| image        | string     | NOT NULL |
| name         | string     | NOT NULL |
| detail       | text       | NOT NULL |
| category     | string     | NOT NULL |
| status       | string     | NOT NULL |
| shipping_fee | integer    | NOT NULL |
| days_to_ship | integer    | NOT NULL |
| price        | integer    | NOT NULL |
| user         | references | NOT NULL |
| order        | references | NOT NULL |

### Association

- belongs_to :users
- belongs_to :orders

## orders テーブル

| Column         | Type    | Options  |
| -------------- | ------- | -------- |
| card           | integer | NOT NULL |
| expiry         | integer | NOT NULL |
| security       | integer | NOT NULL |
| Postal_code    | integer | NOT NULL |
| Prefectures    | string  | NOT NULL |
| municipalities | string  | NOT NULL |
| address        | integer | NOT NULL |
| building  | string  |          |
| phone          | integer | NOT NULL |

### Association

- belongs_to :user
- has_many :items