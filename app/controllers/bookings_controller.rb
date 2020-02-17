class BookingsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.car = Car.find(params["car_id"])
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
    authorize @booking
  end

  private

  def params_booking
    params.require(:booking).permit(:starting_day, :ending_day, :review)
  end
end
