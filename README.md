# テーブル設計

## users テーブル
|Column            |Type    |Options                   |
|------------------|--------|--------------------------|
| nickname         | string | null false               |
| email            | string | null false, unique: true |
| last_name        | string | null false               |
| first_name       | string | null false               |
| last_name_kana   | string | null false               |
| first_name_kana  | string | null false               |
| birthday         | date   | null false               |

### Association
- has_many :items
- has_many :buy_items


## items テーブル
|Column                  |Type        |Options            |
|------------------------|------------|-------------------|
| item_name              | string     | null false        |
| item_description       | text       | null false        |
| category               | integer    | null false        |
| item_status            | integer    | null false        |
| delivery_charge_burden | integer    | null false        |
| delivery_area          | integer    | null false        |
| days_to_ship           | integer    | null false        |
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

### Association
- belongs_to :user
- belongs_to :buy item
- has_one :address


## addressesテーブル
|Column         |Type        |Options            |
|---------------|------------|-------------------|
| postal_code   | string     | null false        |
| prefectures   | string     | null false        |
| municipality  | string     | null false        |
| house number  | string     | null false        |
| building_name | string     |                   |
| tel_number    | string     | null false        |
| user          | references | foreign_key: true |

### Association
- belongs_to :buy_item