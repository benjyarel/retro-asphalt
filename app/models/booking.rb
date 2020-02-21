class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  monetize :amount_cents
  validates :starting_day, :ending_day, presence: true, availability: true
  validate :positive_booking_duration
end

private

def positive_booking_duration
  return if :starting_day.blank? || :ending_day.blank?

  if ending_day < starting_day
    errors.add(:ending_day, "Doit être antérieur au jour de départ")
  end

end
