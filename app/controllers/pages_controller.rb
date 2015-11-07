class PagesController < ApplicationController
    
    def home
        if user_signed_in?
            redirect_to user_path(current_user)
        end
    end
    
    def about
    end
    
    def contact
    end
    
end
