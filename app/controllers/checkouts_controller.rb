class CheckoutsController < ApplicationController
  before_action :valid_order, only: [:edit, :update]
  def edit
    @order = current_order
  end

  def update
    @order = current_order
    if current_order.update_attributes(params_order)
      flash[:success] = "Thank you for purchasing our product"
      @order.notify
      session[:order_ids] = (session[:order_ids] || []).push current_order.id
      session.delete(:order_id)
      redirect_to users_order_histories_path
    else
      flash[:danger] = "Error! please check your cart"
    end
  end
  private

  def params_order
    params.require(:order).permit(:user_id, :name, :email, :phone, :address)
  end

end
