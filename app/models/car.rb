class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :picture
  monetize :price_cents
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :brand, :model, :year, :price, :address, presence: true
  validates :description, length: { in: 30..500 }
  after_create :send_created_email

  def unavailable_dates
    bookings.pluck(:starting_day, :ending_day).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def send_created_email
    CarMailer.with(car: self).created.deliver_now
  end
end
