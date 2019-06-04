class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.string :description
      t.integer :sale_price
      t.integer :sale_count
      t.string :status

      t.timestamps
    end
  end
end
