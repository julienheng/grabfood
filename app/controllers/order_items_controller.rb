class OrderItemsController < ApplicationController
  def index
  end

  def create
    @restaurant = Restaurant.find(params[:order_item][:restaurant_id])
    @order = Order.find(params[:order_id])
    @item = Item.find(params[:order_item][:item_id])
    @order_item = OrderItem.new(order_item_params)
    @order_item.item = @item
    @order_item.order = @order
    authorize @order_item

    respond_to do |format|
      if @order_item.save
        format.html do
          flash.alert = "Item Added To Order!"
          redirect_to restaurant_path(@restaurant, order: @order)
        end

        format.json
      end
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    authorize @order_item
    @order_item.save
  end


  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end

end
