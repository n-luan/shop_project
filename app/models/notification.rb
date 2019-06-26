class Notification < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :order, optional: true, dependent: :destroy
  belongs_to :user, optional: true, dependent: :destroy

  scope :unread,->{where opened_at: nil}
  scope :check, -> (user_id){ where("opened_at = ? and user_id = ?", 'nil', "#{user_id}") }

  def perform
    ActionCable.server.broadcast "notifications_channel",
    notification: ApplicationController.renderer.render(partial: "manager/notifications/notification", locals: { notification: self }), counter: ApplicationController.renderer.render(partial: "manager/notifications/counter", locals: { counter: Notification.unread.size })
  end

  def perform_1
    ActionCable.server.broadcast "notifications_channel_#{self.user_id}",
      notification: ApplicationController.renderer.render(partial: "notifications/notification", locals: { notification: self }), counter: ApplicationController.renderer.render(partial: "notifications/counter", locals: { counter: Notification.check(self.user_id).size })
  end
end
