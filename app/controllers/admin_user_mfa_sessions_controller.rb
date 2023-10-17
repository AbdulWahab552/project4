require 'rqrcode'
require 'rotp'
class AdminUserMfaSessionsController < ApplicationController
  def custom_post_action
    email = params[:admin_user][:email]
    password = params[:admin_user][:password]
    @current_admin_user = AdminUser.find_for_database_authentication(email: email)
    if @current_admin_user && @current_admin_user.valid_password?(password)
      if redis_allow_login?(@current_admin_user)
        sign_in @current_admin_user
        if @current_admin_user.mfa_enabled
          puts "MFA Enabled"
          render :new
        else
          puts "MFA Disabled"
          redirect_to '/admin'
        end
      else
        puts "User is already logged in else where."
        redirect_to '/admin'
      end
    else
      puts "Password is Incorrect"
      redirect_to '/admin'
    end
  end
  def new
    puts "New  Function Tiggerd"
    render :new
  end
  def create
    user_id = params[:admin_user_id]
    @current_admin_user = AdminUser.find(user_id)
    user =  @current_admin_user
    if user.google_authentic?(params[:otp_attempt])
      puts"agya andar haah"
      redirect_to '/admin'
    else
      flash[:error] = "Wrong code"
      render :new
    end
  end
  private
   def redis_allow_login?(user_id)
    puts "user_id#{user_id}"
    puts "Current User Id#{current_admin_user.id}"
    redis = Redis.new
   # session_key_to_remove = 'active_sessions:2'
    #res = redis.srem('active_sessions', session_key_to_remove)
   # if res == true
    # puts "The user's session was removed."
    #puts "The user's session was not found in the set."
    #else
     # puts "An error occurred during the removal operation."
    #end
     redis_key = "active_sessions:#{current_admin_user.id}"
     if redis.sismember('active_sessions', redis_key)
     return false
     else
     redis.sadd('active_sessions', redis_key)
     redis.expire(redis_key, 3600)
     return true
     end
    end
end
