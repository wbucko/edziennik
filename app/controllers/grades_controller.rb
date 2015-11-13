class GradesController < ApplicationController
  before_filter :admin_verify, except: [:show]

  def index
    @grades = Grade.all
  end
  
  def show
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
  
  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(grades_params)
        flash[:success] = 'Ocena zaktualizowana!'
        redirect_to grades_path
    else
        flash[:danger] = 'Uzupełnij wszystkie pola!'
        render action: :edit
    end
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