class Notification < ApplicationRecord
  after_create_commit :perform
  belongs_to :admin, optional: true
  belongs_to :order, optional: true, dependent: :destroy
  scope :unread,->{where opened_at: nil}

  def perform
    ActionCable.server.broadcast "notifications_channel",
    notification: ApplicationController.renderer.render(partial: "manager/notifications/notification", locals: { notification: self }), counter: ApplicationController.renderer.render(partial: "manager/notifications/counter", locals: { counter: Notification.unread.size })
  end
end
