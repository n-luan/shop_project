class AddSubtotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :subtotal, :integer
  end
end
