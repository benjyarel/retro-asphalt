class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @car = @booking.car
    days_booked = (@booking.ending_day - @booking.starting_day + 1).floor
    @booking.amount_cents = @booking.car.price_cents * days_booked
    # @booking.user = current_user
    # @booking.car_sku = @car.sku
    # @booking.state = "pending"
    @booking.update_attributes(user: current_user, car_sku: @car.sku, state:'pending')

    @booking.save ? stripe_paiement_session : render(:new)

    authorize @booking
  end

  private

  def params_booking
    params.require(:booking).permit(:starting_day, :ending_day, :review, :car_id)
  end

  def stripe_paiement_session
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @booking.car.sku,
        images: [image_url_for_stripe(@booking.car.picture)],
        amount: @booking.amount_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: booking_url(@booking),
      cancel_url: booking_url(@booking)
    )
    @booking.update_attribute(:checkout_session_id, session.id)
    redirect_to new_booking_payment_path(@booking)
  end

  def image_url_for_stripe(picture)
    if picture.attached?
      picture.key
    else
      ActionController::Base.helpers.image_url('no-picture.png')
    end
  end
end
