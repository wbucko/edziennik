class UsersController < ApplicationController

   def show
      @user = User.find(params[:id])
      redirect_to users_path unless (User.find(params[:id]) == current_user || @user.email == 'admin@admin.pl')
   end
   
   def index
      @users = User.all
   end
    
end