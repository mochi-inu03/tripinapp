class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true,
                       length: { maximum: 10 },
                       format: { with: /\A[一-龥ぁ-んァ-ヶーa-zA-Z]+\z/, message: "は全角文字または英字で入力してください" }
  validates :birthday, presence: true
end
