class PagesController < ApplicationController
    
    def home
        if current_user.email != 'admin@admin.pl'
            redirect_to user_path(current_user)
        end
    end
    
    def about
    end
    
    def contact
    end
    
end
