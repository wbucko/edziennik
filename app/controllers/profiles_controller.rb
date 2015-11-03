class ProfilesController < ApplicationController
   def new
    @user = User.find(params[:user_id])
    @profile = @user.build_profile
   end
   
    def create
        @user = User.find(params[:user_id])
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profil zaktualizowany!"
            redirect_to index_path( params[:user_id])
        else
            render action: :new
        end
    end
    
    
    private
    def profile_params
       params.require(:profile).permit(:first_name, :last_name, :year, :contact_email, :opinion) 
    end
end