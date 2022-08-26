class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]
  before_action :skip_authorization

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.restaurant = Restaurant.find(params[:restaurant_id])
    if @item.save
      redirect_to restaurant_path(@item.restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @item = Item.find(params[:id])
    @item.restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.update(item_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # raise
    @item = Item.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item.destroy
    redirect_to restaurant_path(@restaurant), status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :photo)
  end
end
