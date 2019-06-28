class AddUserIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :user_id, :integer
  end
end
