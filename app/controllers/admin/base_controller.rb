class Admin::BaseController < ActionController::Base
  before_action :logged_in_admin
  include SessionsHelper
  layout "admin/application"
end
