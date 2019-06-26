class Manager::OrdersController < Manager::BaseController
  before_action :load_order, except: [:index, :new, :create]

  def index
    @orders = Order.all
    if params[:notification]
      @notification = Notification.find params[:notification]
      @notification.update opened_at: Time.zone.now
    end
  end

  def show
    @order = Order.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def edit; end

  def update
    @order.update status: params[:status]
    @orders = Order.all
    @notification = Notification.create(user_id: @order.user_id, event: @order.status)
    @notification.perform_1
  end

  def destroy
    @order.destroy
    @orders = Order.all
    respond_to do |format|
      format.js
    end
  end

  private

  def load_order
    @order = Order.find params[:id]
  end
end
