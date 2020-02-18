class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :picture
  monetize :price_cents
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :brand, :model, :year, :price, :address, presence: true
  validates :description, length: { in: 30..500 }
end
