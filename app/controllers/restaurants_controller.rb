class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :show

  def index
    @restaurants = Restaurant.all
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
      redirect_to restaurants_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @restaurant

    if user_signed_in?
      unless params.include?('order')
        @order = Order.create!(user: current_user)
        return redirect_to restaurant_path(@restaurant, order: @order)
      end

      @order = Order.find(params[:order])
    end

    # redirect to seller page if current user is owner
    render :show_seller if @restaurant.user == current_user
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

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :location, :opening_hour, :closing_hour, :photo)
  end
end
