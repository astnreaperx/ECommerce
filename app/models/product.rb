class Product < ApplicationRecord
  # name, description, price, delivery_cost
  belongs_to :woodworker

  has_many :product_categories
  has_many :categories, through: :product_categories
end
