class Order < ApplicationRecord
  # customer_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :order
  has_many :product_orders
  has_many :products, through: :product_orders
end
