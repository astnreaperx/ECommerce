class Owner < ApplicationRecord
    validates :website_name, :owner_name, :website_description, presence: true
    validates :website_description, length: { minimum: 20 }
end
