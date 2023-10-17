class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :otp_attempt # Define a virtual attribute
  attr_accessor :mfa_enabled_virtual
  attr_accessor :admin_user_id

  acts_as_google_authenticated :lookup_token => :mfa_secret, :encrypt_secrets => true
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
         def self.ransackable_attributes(auth_object = nil)
          ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
        end

end
