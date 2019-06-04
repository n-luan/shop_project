class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :phone
      t.string :email
      t.string :name
      t.string :status
      t.string :address

      t.timestamps
    end
  end
end
