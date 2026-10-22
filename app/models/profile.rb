class Profile < ApplicationRecord
  belongs_to :user
  validates :message, presence: true, length: { maximum: 200 }
  validates :user_id, uniqueness: true   # 1人1つまで
end