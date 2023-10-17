require 'rqrcode'
require 'rotp'
class AdminUsersController < ApplicationController
  def destroy_admin_user_session_path
    puts"Destroy Function OverRide"
    redis = Redis.new
    redis.sismember('active_sessions', current_admin_user_id)
    sign_out current_admin_user
    redirect_to '/admin'
  end
  def edit_two_factor
    user_id = params[:id]
    @admin_user = AdminUser.find(user_id)
    if @admin_user
      sign_in @admin_user
      @admin_user.set_google_secret
      @secret_key = @admin_user.google_secret_value
      @admin_user.save
      @admin_user.reload
      @admin_user.google_qr_uri
      puts "#{@admin_user.google_qr_uri}"
      puts "#{@secret_key}"
      render :edit_two_factor
    end
  end
  def check_two_factor
    puts" Check Two Factor "
    user_id = params[:admin_user_id]
    @admin_user = AdminUser.find(user_id)
    otp_attempt = params[:admin_user][:otp_attempt]
    @admin_user.mfa_enabled = params[:admin_user][:mfa_enabled]
    @admin_user.save
    puts "OTP ATTEMPT#{otp_attempt}"
    if @admin_user.google_authentic?(otp_attempt)
      puts"agya andar haah"
      redirect_to '/admin'
    else
      puts"INvalid"
      flash[:error] = "Wrong code"
      render "admin_users/edit_two_factor"
    end
  end
end
