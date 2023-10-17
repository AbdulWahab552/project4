Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(
    controllers: {
      sessions: 'admin_users/sessions'
    }
  )
    ActiveAdmin.routes(self)
   post '/custom_login', to: 'sessions#create', as: 'custom_login'
   get '/admin_user_mfa_session/new', to: 'admin_user_mfa_sessions#new', as: 'new_admin_user_mfa_session'
   post 'admin_user_mfa_sessions', to: 'admin_user_mfa_sessions#create', as: 'create_admin_user_mfa_sessions'
   post 'custom_post_action', to: 'admin_user_mfa_sessions#custom_post_action',as: 'custom_post_action_admin_user_mfa_sessions'
     resources :admin_users do
       get 'edit_two_factor', on: :member
       post 'check_two_factor', on: :member
     end
     mount SampleApi => '/api'
     mount CategoryApi => '/api'
     mount ProductApi => '/api'
     mount BrandsApi => '/api'
     mount RelationApi => '/api'
     mount ProductRetailerApi => '/api'
end
