class Problem < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1000,
                                             too_long: '1000 characters in post is the maximum allowed.' }

  belongs_to :user
  belongs_to :category
  has_rich_text :body
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
