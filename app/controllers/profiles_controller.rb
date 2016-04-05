class ProfilesController < ApplicationController
  before_action :set_user
  before_action :only_current_user
  before_action :authenticate_user!

    
  def new
    @profile = @user.build_profile
  end
   
  def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profil utworzony!"
      redirect_to root_path
    else
      flash[:danger] = 'Poprawnie uzupełnij wszystkie pola!'
      render :new
    end
  end
    
  def edit
    @profile = @user.profile
  end
    
  def update
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = 'Profil zaktualizowany!'
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Poprawnie uzupełnij wszystkie pola!'
      render :edit
    end
  end
    
  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :year, :contact_email, :opinion) 
  end
  
  def only_current_user
    current_user_or_admin(root_path)
  end  
end