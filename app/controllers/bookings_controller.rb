class BookingsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @car = @booking.car

    days_booked = (@booking.ending_day - @booking.starting_day + 1).floor
    @booking.amount_cents = @car.price_cents * days_booked
    @booking.user = current_user
    @booking.car_sku = @car.sku
    @booking.state = "pending"

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @car.sku,
        images: [instance_image_path(@booking.car.picture)],
        amount: @booking.amount_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: booking_url(@booking),
      cancel_url: booking_url(@booking)
    )
    @booking.update(checkout_session_id: session.id)
    redirect_to new_booking_payment_path(@booking)

    # ----------------------------------
    # @booking = Booking.new(params_booking)
    # @booking.user = current_user
    # if @booking.save
    #   redirect_to dashboard_path
    # else
    #   render :new
    # end
    authorize @booking
  end

  private

  def params_booking
    params.require(:booking).permit(:starting_day, :ending_day, :review, :car_id)
  end
end
