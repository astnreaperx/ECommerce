class Woodworker < ApplicationRecord
  # user_name, first_name, last_name, shop_name, address
  has_many :products
end
