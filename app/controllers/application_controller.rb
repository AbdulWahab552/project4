class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    puts "Custom Post Action"
    @current_admin_user=resource
    if @current_admin_user
      if redis_allow_login?(@current_admin_user)
        sign_in @current_admin_user
        if@current_admin_user.mfa_enabled
          puts "MFA Enabled"
          new_admin_user_mfa_session_path
        else
          puts "MFA Disabled"
          admin_dashboard_path
        end
      else
        puts "User is already logged in elsewhere."
        new_admin_user_session_path
      end
    else
      puts "Password is Incorrect"
      new_admin_user_session_path
    end
  end
  def new
    puts "New  Function Tiggerd"
    render :new
  end
  def create
    puts "Create Function Triggered"
    user_id = params[:admin_user_id]
    current_admin_user = AdminUser.find(user_id)
    user =  current_admin_user
    if user.google_authentic?(params[:otp_attempt])
      puts"agya andar haah"
       admin_dashboard_path
    else
      flash[:error] = "Wrong code"
      new_admin_user_mfa_session_path
    end
  end
  private
   def redis_allow_login?(user_id)
    puts "Redis Allow Func"
    puts "user_id#{user_id}"
    puts "Current User Id#{current_admin_user.id}"
    redis = Redis.new

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
