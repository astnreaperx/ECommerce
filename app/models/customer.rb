class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # user_name, first_name, last_name, email, password, address

  has_many :orders
  belongs_to :province

  validates :first_name, :last_name, :user_name, :address, :email, presence: true
  validates :user_name, length: { minimum: 6 }
end
