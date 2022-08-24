class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.restaurant = Restaurant.find(params[:restaurant_id])
    if @item.save
      redirect_to item_path(@item.restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = item.find(params[:id])
  end

  def update
    @item = item.find(params[:id])
    @item.restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item = item.find(params[:id])
    @item.destroy
    redirect_to items_path(@item.restaurant), status: :see_other
  end

  private

  def set_item
    @item = item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :photo)
  end
end
