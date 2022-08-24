class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = current_user.restaurants
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @restaurant
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize @restaurant
    @restaurant = Restaurant.update(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    authorize @restaurant
    @restaurant = Restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  def admin
    @restaurants = current_user.restaurants
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :location, :rating)
  end
end
