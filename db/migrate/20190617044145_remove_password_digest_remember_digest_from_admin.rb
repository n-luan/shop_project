class RemovePasswordDigestRememberDigestFromAdmin < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :password_digest, :string
    remove_column :admins, :remember_digest, :string
  end
end
