class Province < ApplicationRecord
  # name, location, tax_rate
  has_many :orders
  has_many :customers
end
