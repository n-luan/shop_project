class Users::OrderHistoriesController < ApplicationController

  def index
    if user_signed_in?
      @orders = Order.where(user_id: current_user.id).page(params[:page]).per(5)
    else
      @orders = Order.where(id: session[:order_ids]).page(params[:page]).per(5)
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
