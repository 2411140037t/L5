class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :user_id, uniqueness: { scope: :tweet_id }   # 同じツイートに二重いいね禁止
end