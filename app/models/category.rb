class Category < ApplicationRecord
  validates :category, uniqueness: true
  has_many :problems
end
