class Category < ApplicationRecord
  validates :category, uniqueness: true
  validates :category, presence: true
  has_many :problems
end
