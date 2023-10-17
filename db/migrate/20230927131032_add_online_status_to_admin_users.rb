class AddOnlineStatusToAdminUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :online_status, :boolean
  end
end
