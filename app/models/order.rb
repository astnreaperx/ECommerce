class Order < ApplicationRecord
  # customer_id, province_id

  belongs_to :customer
  belongs_to :province
end
