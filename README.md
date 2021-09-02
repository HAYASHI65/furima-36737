# テーブル設計

## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| nickname              | string     | null: false                    |
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birthday              | date       | null: false                    |

# has_many :items
# has_many :user_items


## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| name                  | string     | null: false                    |
| text                  | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| fee_id                | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| delivery_days_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

# belongs_to :user
# has_one :user_item 


## user_itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

# belongs_to :user
# belongs_to :item
# has_one :address


## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| post_code             | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| block                 | string     | null: false                    |
| building              | string     |                                |
| phone_number          | string     | null: false                    |
| user_item             | references | null: false, foreign_key: true |

# belongs_to :user_item