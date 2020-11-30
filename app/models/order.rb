class Order < ApplicationRecord
  # customer_id
  validates :customer, presence: true

  belongs_to :customer
  has_many :product_orders
  has_many :products, through: :product_orders
end
