class Product < ApplicationRecord
  # name, description, price, delivery_cost
  max_paginates_per 20

  belongs_to :woodworker

  has_many :product_categories
  has_many :categories, through: :product_categories

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
