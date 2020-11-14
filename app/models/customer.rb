class Customer < ApplicationRecord
  # user_name, first_name, last_name, email, password, address

  has_many :orders
end
