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
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(permit_cars_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def permit_cars_params
    params.require(:car).permit(:brand, :model, :picture, :address, :power, :price)
  end
end
