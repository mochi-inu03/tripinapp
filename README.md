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


# TripinApp（旅行スポット投稿アプリ）

##  アプリ概要
旅行先やお出かけ先で見つけた「おすすめスポット」を投稿・共有できるサービスです。  
地図検索と連携して、位置情報・写真・カテゴリ付きで簡単に記録できます。

##  アプリURL（デプロイ済み）
https://tripinapp.onrender.com

##  対象ユーザー
- 旅好きな人
- 自分の記録を残したい人
- 他人の旅の記録を参考にしたい人

##  使用技術
- **フレームワーク**：Ruby on Rails
- **認証機能**：Devise
- **画像管理**：Active Storage
- **地図機能**：Google Maps JavaScript API（Place Autocomplete）
- **位置情報取得**：Geocoder
- **DB**：MySQL（Renderで本番環境構築）

##  主な機能
- ユーザー登録・ログイン機能（Devise使用）
- スポット投稿フォーム（地図検索・緯度経度自動取得）
- 投稿一覧表示（新着順）
- 投稿の詳細ページ（写真・地図・説明など）
- 投稿の編集・削除（投稿者のみ）
- カテゴリ別絞り込み

##  工夫した点
- Google Maps API を活用し、地図検索の補完と自動位置情報取得を実現
- Active Storage で画像の投稿・保存を簡単に
- 投稿機能の権限管理（本人のみ編集削除）を実装

##  今後の改善予定
- コメント機能の追加
- お気に入り（いいね）機能
- スマホUIの改善（レスポンシブ対応）

##  GitHubリポジトリ
https://github.com/mochi-inu03/tripinapp
