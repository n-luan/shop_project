class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories
  helper_method :current_order

  def after_sign_in_path_for(resource)
    case resource.class.name
    when "Admin"
      manager_root_path
    when "User"
      session[:forwarding_url] || stored_location_for(resource) || root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      stored_location_for(resource) || root_path
    else
      root_path
    end
  end

  def current_order
    session[:order_id].present? ? Order.find_by(id: session[:order_id]) || Order.new : Order.new
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
  end

  def set_categories
    @categories = Category.all
  end
end
