# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| user_name          | string | null: false               |
| user_name_kana     | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :products
- has_many :purchases

## productsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | string     | null: false                    |
| description   | string     | null: false                    |
| price         | string     | null: false                    |
| category      | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| delivery_days | string     | null: false                    |
| user_eria     | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product_id | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :purchase

## addressesテーブル


| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_number | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| block         | string | null: false |
| building      | string |             |
| phone_number  | string | null: false |

### Association

- belongs_to :purchase