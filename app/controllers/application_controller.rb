class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || index_path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || index_path
  end
  def after_sign_out_path_for(resource)
    stored_location_for(resource) || index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
  end

  def set_categories
    @categories = Category.all
  end

end
