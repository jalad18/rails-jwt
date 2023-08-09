class Property < ApplicationRecord
    belongs_to :user
    validates :name, :price, :country, :year, presence: true
    enum status: { Sale: 0, Rent: 1, Sold: 2 }
end
