class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @cars = Car.all
  end

  def show
  end
end
