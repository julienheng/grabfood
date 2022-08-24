class Orderorder_itemsController < ApplicationController

  def new
    @order_item = Order_item.new
  end

  def create
    @order_item = Order_item.new(order_item_params)
    @order_item.order = Order.find(params[:order_id])
    if @order_item.save
      redirect_to order_item_path(@order_item.order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @order_item = Order_item.find(params[:id])
    @order_item.destroy
    redirect_to order_items_path(@order_item.order), status: :see_other
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
end
