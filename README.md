# DB 設計

## users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :spots  
- has_many :comments

---

## spots table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| image       | string     | null: false                    |
| address     | string     |                                |
| latitude    | float      |                                |
| longitude   | float      |                                |
| category_id | integer    | null: false                    |

### Association

- belongs_to :user  
- has_many :comments

---

## comments table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| spot       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| content    | text       | null: false                    |
| created_at | datetime   | null: false                    |

### Association

- belongs_to :user  
- belongs_to :spot
