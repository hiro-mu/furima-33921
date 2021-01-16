# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| kanji_name | string | null: false |
| kana_name  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_information  | string     | null: false                    |
| item_category     | string     | null: false                    |
| item_condition    | string     | null: false                    |
| shipping_fee_type | string     | null: false                    |
| shipping_area     | string     | null: false                    |
| days_to_ship      | string     | null: false                    |
| item_value        | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase