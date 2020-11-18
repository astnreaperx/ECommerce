class Product < ApplicationRecord
  # name, description, price, delivery_cost
  max_paginates_per 20

  belongs_to :woodworker

  has_many :product_categories
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  def self.search(search)
    where("name LIKE ? OR description LIKE ?", "%#{search}%","%#{search}%")
  end
end
