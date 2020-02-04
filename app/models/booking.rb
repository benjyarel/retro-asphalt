class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :starting_day, :ending_day, presence: true
end
