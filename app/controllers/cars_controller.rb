class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(permit_cars_params)
    @car.user = current_user
    if @car.save
      redirect_to dashboard_path
    else
      render :new
    end
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

  def destroy
    @car.delete
  end

  private

  def find_car
    @car = Car.find(params[:id])
  end

  def permit_cars_params
    params.require(:car).permit(:brand, :model, :picture, :address, :power, :price, :description, :year)
  end
end
