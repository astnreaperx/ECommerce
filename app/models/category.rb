class Category < ApplicationRecord
  # name, description
  validates :name, :description, presence: true
  validates :name, length: { minimum: 5 }

  has_many :product_categories
  has_many :products, through: :product_categories
end
