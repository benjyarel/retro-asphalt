class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @car = Car.find(params[:id])
  end

  private

  def permit_cars_params
    params(:cars).permit(:brand, :model, :picture, :address, :power, :price)
  end
end
