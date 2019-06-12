class AddColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :facebook, :string
    add_column :profiles, :twitter, :string
    add_column :profiles, :instagram, :string
  end
end
