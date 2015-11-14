class UsersController < ApplicationController
   before_filter :authenticate_user!
   
   def show
      @user = User.find(params[:id])
      redirect_to users_path unless (@user == current_user || current_user.email == 'admin@admin.pl')
   end
   
   def index
      @users = User.all
   end
    
end