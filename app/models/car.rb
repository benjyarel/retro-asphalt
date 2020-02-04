class Car < ApplicationRecord
  belongs_to :user
  validates :brand, :model, :year, :price, :address, presence: true
  validates :description, length: { in: 30..500 }
end
