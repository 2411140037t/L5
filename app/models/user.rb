class User < ApplicationRecord
  has_one  :profile, dependent: :destroy        # ← 追加（1:1）
  has_many :tweets,  dependent: :destroy
  has_many :likes,   dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  validates :uid,  presence: true, uniqueness: true
  validates :pass, presence: true
end