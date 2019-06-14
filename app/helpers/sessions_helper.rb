module SessionsHelper

  def valid_order
    unless current_order.product_orders.presence
      flash[:info] = "Continuing shopping!"
      redirect_to root_path
    end
  end

end
