# テーブル設計

## usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| user_name_family      | string | null: false               |
| user_name_first       | string | null: false               |
| user_name_kana_family | string | null: false               |
| user_name_kana_first  | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :products
- has_many :purchases

## productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| item_state_id   | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| user_area_id    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addressesテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_number | string     | null: false                    |
| user_area_id  | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase