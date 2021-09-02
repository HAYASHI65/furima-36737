# テーブル設計

## usersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| nickname              | string     | null: false                    |
| email                 | string     | null: false                    |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| year_birth_at         | string     | null: false                    |
| month_birth_at        | string     | null: false                    |
| day_birth_at          | string     | null: false                    |

# has_many :items
# has_one :creditCard
# has_one :address


## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| name                  | string     | null: false                    |
| text                  | text       | null: false                    |
| category              | string     | null: false                    |
| status                | string     | null: false                    |
| fee                   | string     | null: false                    |
| delivery_from         | string     | null: false                    |
| delivery_days         | string     | null: false                    |
| price                 | integer    | null: false                    |
| user_id               | references | null: false, foreign_key: true |

# belongs_to :user
# has_one :creditCard


## creditCardsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user_id               | references | null: false, foreign_key: true |
| customer_id           | string     | null: false                    |
| card_id               | string     | null: false                    |

# belongs_to :user
# belongs_to :item
# has_one :address


## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| post_code             | integer    | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| block                 | string     | null: false                    |
| building              | string     | null: false                    |
| phone_number          | integer    | null: false                    |

# belongs_to :user
# belongs_to :creditCards