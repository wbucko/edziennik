class PagesController < ApplicationController
    
  def home
    if user_signed_in? && current_user.email != 'admin@admin.pl'
      redirect_to current_user.profile ? user_path(current_user) : new_user_profile_path(current_user) 
    end
  end
    
  def about
  end
    
  def contact
  end
end
