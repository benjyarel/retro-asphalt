class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = policy_scope(Car)
  end

  def show
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(permit_cars_params)
    @car.user = current_user
    if @car.save
      redirect_to dashboard_path
    else
      render :new
    end
    authorize @car
  end

  def edit
    authorize @car
  end

  def update
    if @car.update(permit_cars_params)
      redirect_to dashboard_path
    else
      render :edit
    end
    authorize @car
  end

  def destroy
    @car.delete
    authorize @car
  end

  private

  def find_car
    @car = Car.find(params[:id])
  end

  def permit_cars_params
    params.require(:car).permit(:brand, :model, :picture, :address, :power, :price, :description, :year)
  end
end
