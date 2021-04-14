# テーブル設計

## users テーブル
|Column            |Type    |Options                   |
|------------------|--------|--------------------------|
| nickname         | string | null false               |
| mail_address     | string | null false, unique: true |
| password         | string | null false               |
| confirm password | string | null false               |
| last_name        | string | null false               |
| first_name       | string | null false               |
| last_name_kana   | string | null false               |
| first_name_kana  | string | null false               |
| birthday_year    | string | null false               |
| birthday_month   | string | null false               |
| birthday_day     | string | null false               |

### Association
- has_many :items
- has_many :buy_items
- has_many :addresses


## items テーブル
|Column                  |Type        |Options            |
|------------------------|------------|-------------------|
| item_name              | string     | null false        |
| item_description       | text       | null false        |
| category               | string     | null false        |
| item_status            | string     | null false        |
| delivery_charge_burden | string     | null false        |
| delivery_area          | string     | null false        |
| days_to_ship           | string     | null false        |
| price                  | string     | null false        |
| user                   | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy_item


## buy_itemsテーブル
|Column   |Type        |Options            |
|---------|------------|-------------------|
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |
| address | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buy item
- belongs_to :address

## addressesテーブル
|Column         |Type        |Options            |
|---------------|------------|-------------------|
| postal_code   | string     | null false        |
| prefectures   | string     | null false        |
| municipality  | string     | null false        |
| house number  | string     | null false        |
| building_name | string     |                   |
| user          | references | foreign_key: true |

### Association
- belongs_to :user
- has_one : buy_item