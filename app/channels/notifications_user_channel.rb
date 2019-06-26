class NotificationsUserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_channel_#{current_user.id}"
  end

  def unsubscribed

  end
end
