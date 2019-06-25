class Manager::BaseController < ActionController::Base
  before_action :authenticate_admin!
  layout "admin/application"
  before_action :set_notification

  def set_notification
    @notifications = Notification.unread
  end
end
