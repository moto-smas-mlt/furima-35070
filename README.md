# テーブル設計

## users テーブル
|Column              |Type    |Options                   |
|------------------- |--------|--------------------------|
| nickname           | string | null false               |
| email              | string | null false, unique: true |
| encrypted_password | string | null false               |
| last_name          | string | null false               |
| first_name         | string | null false               |
| last_name_kana     | string | null false               |
| first_name_kana    | string | null false               |
| birthday           | date   | null false               |

### Association
- has_many :items
- has_many :buy_items


## items テーブル
|Column                     |Type        |Options            |
|---------------------------|------------|-------------------|
| name                      | string     | null false        |
| description               | text       | null false        |
| category_id               | integer    | null false        |
| item_status_id            | integer    | null false        |
| delivery_charge_burden_id | integer    | null false        |
| prefecture_id             | integer    | null false        |
| days_to_ship_id           | integer    | null false        |
| price                     | integer    | null false        |
| user                      | references | foreign_key: true |

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
- belongs_to :item
- has_one :address


## addressesテーブル
|Column          |Type        |Options            |
|--------------- |------------|-------------------|
| postal_code    | string     | null false        |
| prefecture_id  | integer    | null false        |
| municipality   | string     | null false        |
| house_number   | string     | null false        |
| building_name  | string     |                   |
| tel_number     | string     | null false        |
| buy_item       | references | foreign_key: true |

### Association
- belongs_to :buy_item