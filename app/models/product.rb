class Product < ApplicationRecord
 # name, description, price, delivery_cost

  has_many :product_categories
  has_many :categories, through: :product_categories
end
