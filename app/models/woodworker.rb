class Woodworker < ApplicationRecord
  # user_name, first_name, last_name, shop_name, address
  validates :user_name, uniqueness: true
  validates :user_name, :first_name, :last_name, :shop_name, :address, presence: true

  has_many :products

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
