class AddRememberDigestToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :remember_digest, :string
  end
end
