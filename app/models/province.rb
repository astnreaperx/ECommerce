class Province < ApplicationRecord
  # name, location, tax_rate
  validates :name, uniqueness: true
  validates :name, :gst, :pst, :hst, presence: true

  has_many :orders
  has_many :customers
end
