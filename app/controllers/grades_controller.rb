class GradesController < ApplicationController
  before_action :admin_verify, except: [:show]
  before_action :grades_and_tests, only: [:new, :edit]
  before_action :set_grade, only: [:edit, :update, :destroy]

  def index
    @grades = Grade.all.order('test_id DESC')
  end
  
  def show
    @grades = Grade.all
    @user = User.find(params[:id])
  end
   
  def new
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
  end
  
  def update
    if @grade.update_attributes(grades_params)
      flash[:success] = 'Ocena zaktualizowana!'
      redirect_to grades_path
    else
      flash[:danger] = 'Uzupełnij wszystkie pola!'
      render :edit
    end
  end
  
  def destroy
    @grade.destroy
    flash[:success] = 'Ocena usunięta.'
    redirect_to grades_path
  end
  
  private
  def grades_and_tests
    @tests = Test.all
    @users = User.all
  end

  def grades_params
    params.require(:grade).permit(:user_id, :test_id, :result) 
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end
end