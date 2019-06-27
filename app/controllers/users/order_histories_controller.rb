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
    if params[:notification]
      @order = Order.find_by(id: params[:id])
      @notification = Notification.find params[:notification]
      @notification.update opened_at: Time.zone.now
    end
  end

end
