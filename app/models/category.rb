class Category < ApplicationRecord
  # name, description

  has_many :product_categories
  has_many :products, through: :product_categories
end
