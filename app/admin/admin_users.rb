ActiveAdmin.register AdminUser do
permit_params :email, :password, :password_confirmation
action_item :edit_two_factor, only: :show do
  link_to(
    "Setup 2FA",
    edit_two_factor_admin_user_path(admin_user),
  )
end
member_action :edit_two_factor, method: :get do
  @admin_user = AdminUser.find(params[:id])
  render "admin_users/edit_two_factor"
end
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
