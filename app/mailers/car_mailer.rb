class CarMailer < ApplicationMailer

  def created
    @car = params[:car] # Instance variable => available in view
    @user = @car.user
    mail(to: @user.email, subject: "Your #{@car.brand} #{@car.model} successfully created")
  end
end
