class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def new
    @order = Order.new
    authorize @order
    @order.start_time = Time.now.beginning_of_day
    @order.end_time = Time.now.beginning_of_day
  end

  def create
    @order = Order.new(order_params)
    #check whether order id exists
    #if exist, add on
    if @order.save
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @order
    @order = Order.find(params[:id])
  end

  def edit
  end

  def update
    @order = Order.update(order_params)
    @order.save
    redirect_to order_path(@order)
  end

  def destroy
    @order = Order.destroy
    redirect_to orders_path, status: :see_other
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:note, :delivery)
  end
end
