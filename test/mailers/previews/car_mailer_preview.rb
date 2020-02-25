# Preview all emails at http://localhost:3000/rails/mailers/car_mailer
class CarMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/car_mailer/created
  def created
    user = User.first
    car = user.cars.last
    # This is how you pass value to params[:user] inside mailer definition!
    CarMailer.with(car: car).created
  end

end
