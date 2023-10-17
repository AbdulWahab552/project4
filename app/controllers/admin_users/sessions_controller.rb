class AdminUsers::SessionsController < Devise::SessionsController
  def new
    super
  end
  def destroy
    puts "___________________________________________"
    redis = Redis.new
    session_key_to_remove = 'active_sessions:2'
    res = redis.srem('active_sessions', session_key_to_remove)
     if res == true
     puts "The user's session was removed."
     puts "The user's session was not found in the set."
     else
      puts "An error occurred during the removal operation."
     end
     new_admin_user_session_path
     super
  end
end
