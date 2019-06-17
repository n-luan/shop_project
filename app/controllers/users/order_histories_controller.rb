class Users::OrderHistoriesController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id).page(params[:page]).per(5)
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
