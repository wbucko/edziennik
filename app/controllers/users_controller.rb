class UsersController < ApplicationController
  before_action :authenticate_user!
   
  def show
    @user = User.find(params[:id])
    current_user_or_admin(users_path)
  end
   
  def index
    @users = User.all
  end
end