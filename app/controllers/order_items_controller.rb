class OrderItemsController < ApplicationController
  def index
  end

  def create
    @restaurant = Restaurant.find(params[:order_item][:restaurant_id])
    @order = Order.find(params[:order_id])
    @item = Item.find(params[:order_item][:item_id])
    @order_item = OrderItem.new(order_item_params)
    authorize @order_item
    @order_item.item = @item
    @order_item.order = @order
    @order_item.save
    redirect_to restaurant_path(@restaurant, @order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end

end
