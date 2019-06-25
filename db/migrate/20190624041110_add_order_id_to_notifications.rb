class AddOrderIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :order_id, :integer
  end
end
