class AddMfaEnabledToAdminUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :mfa_enabled, :boolean
  end
end
