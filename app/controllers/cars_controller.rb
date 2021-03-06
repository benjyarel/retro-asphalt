class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = policy_scope(Car)

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car })
      }
    end
  end

  def show
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @cars = Car.where("user_id = ?", current_user)
    @car = Car.new(permit_cars_params)
    @car.user = current_user
    if @car.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'pages/dashboard' }
        format.js
      end
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
    redirect_to dashboard_path
    authorize @car
  end

  private

  def authorize_policy
    authorize @car
  end

  def find_car
    @car = Car.find(params[:id])
  end

  def permit_cars_params
    params.require(:car).permit(:brand, :model, :picture, :address, :power, :price, :description, :year)
  end

end
