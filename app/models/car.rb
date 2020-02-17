class Car < ApplicationRecord
  belongs_to :user
  validates :brand, :model, :year, :price, :address, presence: true
  validates :description, length: { in: 30..500 }
  has_one_attached :picture
  monetize :price_cents
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
