class GradesController < ApplicationController
    before_filter :user_find
   
  def new
    @grade = Grade.new
  end 
   
  def create
    @grade = Grade.new(grades_params)
    if @grade.save
        notice[:success] = 'Ocena zapisana'
        render :index
    else
        notice[:danger] = 'Uzupełnij odpowiednie pola'
        render :new
    end
      
  end
  
  private
  def grades_params
     params.require(:grade).permit(:user_id, :test_id, :result) 
  end
  def user_find
      @user = User.find(params[:user_id])
  end
end