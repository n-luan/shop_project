class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
