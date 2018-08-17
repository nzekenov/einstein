class Category < ApplicationRecord
  has_many :categorizings
  has_many :lessons, through: :categorizings
end
