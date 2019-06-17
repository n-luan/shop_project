class Manager::BaseController < ActionController::Base
  before_action :authenticate_admin!
  layout "admin/application"
end
