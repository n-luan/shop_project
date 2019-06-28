class AddIndexToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_index :notifications, :user_id
    add_index :notifications, :opened_at
  end
end
