class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :problem_id }

  belongs_to :user
  belongs_to :problem
end
