class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @cars = Car.where("user_id = ?", current_user)
    @car = Car.new
    @owned_cars_bookings = @cars.map { |car| car.bookings.order(created_at: :desc) }.flatten
    @bookings = current_user.bookings
  end
end
