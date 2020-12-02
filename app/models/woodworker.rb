class Woodworker < ApplicationRecord
  # user_name, first_name, last_name, shop_name, address
  max_paginates_per 20

  has_many :products

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
