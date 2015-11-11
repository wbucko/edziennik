class GradesController < ApplicationController

  def index
    @grades = Grade.all
  end
   
  def new
    @tests = Test.all
    @users = User.all
    @grade = Grade.new
  end 
   
  def create
    @grade = Grade.new(grades_params)
    if @grade.save
        flash[:success] = 'Ocena zapisana.'
        redirect_to grades_path
    else
        flash[:danger] = 'Uzupełnij odpowiednie pola.'
        render :new
    end
  end
  
  def edit 
     @tests = Test.all
     @users = User.all
     @grade = Grade.find(params[:id]) 
  end
  
  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    redirect_to grades_path, notice: 'Ocena usunięta.'
  end
  
  private
  def grades_params
     params.require(:grade).permit(:user_id, :test_id, :result) 
  end

end