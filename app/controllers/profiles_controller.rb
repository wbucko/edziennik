class ProfilesController < ApplicationController
   def new
    @user = User.find(params[:user_id])
    @profile = @user.build_profile
   end
   
    def create
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profil utworzony!"
            redirect_to root_path
        else
            flash[:danger] = 'Uzupełnij wszystkie pola!'
            render action: :new
        end
    end
    
    def edit
        @user = User.find( params[:user_id] )
        @profile = @user.profile
    end
    
    def update
        @user = User.find( params[:user_id] )
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:success] = 'Profil zaktualizowany!'
            redirect_to root_path
        else
            flash[:danger] = 'Uzupełnij wszystkie pola!'
            render action: :edit
        end
    end
    
    private
    
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :year, :contact_email, :opinion) 
   
    end
    
end