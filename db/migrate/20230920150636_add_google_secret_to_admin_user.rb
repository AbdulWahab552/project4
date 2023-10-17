class AddGoogleSecretToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :google_secret, :string
    add_column :admin_users, :mfa_secret, :string
  end
end
