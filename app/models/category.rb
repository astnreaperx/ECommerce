class Category < ApplicationRecord
  # name, description

  belongs_to :product

  has_many :product_categories
  has_many :products, through: :product_categories
end
