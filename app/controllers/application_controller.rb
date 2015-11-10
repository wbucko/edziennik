class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
  if current_user.profile
    user_path(current_user)
  else
    new_user_profile_path(current_user)
  end
end

def admin_verify
  if current_user
   redirect_to user_path(current_user) unless current_user.email == 'admin@admin.pl'
  else
   redirect_to root_path
  end
end

end
