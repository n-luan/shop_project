class OrdersController < ApplicationController
  before_action :valid_order, only: [:show]

  def show
    @order = current_order
    @product_orders = current_order.product_orders
  end

  def update
    @order = current_order
    @product_order = @order.product_orders.find(params[:id])
    if params[:type] == "inc"
      @product_order.quantity += 1
      @product_order.update_attributes quantity: @product_order.quantity
    elsif params[:type] == "dec" && (@product_order.quantity > 0)
      @product_order.quantity -= 1
      @product_order.update_attributes quantity: @product_order.quantity
    end
    @product_orders = @order.product_orders
  end

  def destroy
    @order = current_order
    @product_order = @order.product_orders.find(params[:id])
    @product_order.destroy
    @product_orders = @order.product_orders
  end

end
