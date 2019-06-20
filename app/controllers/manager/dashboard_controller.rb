class Manager::DashboardController < Manager::BaseController
  def index
    if params[:type] == "month"
      @data_user = User.all_data_user2
      @data_order = Order.all_data_order2
      @data_product = Product.all_data_product2
    elsif params[:type] == "week"
      @data_user = User.all_data_user1
      @data_order = Order.all_data_order1
      @data_product = Product.all_data_product1
    else
      @data_user = User.all_data_user
      @data_order = Order.all_data_order
      @data_product = Product.all_data_product
    end
  end
end
