class TestsController < ApplicationController
  before_action :admin_verify
  before_action :set_test, only: [:edit, :update, :destroy]
    
  def index
    @tests = Test.all.order('date DESC')    
  end
   
  def new
    @test = Test.new
  end
   
  def create
    @test = Test.new(tests_params)
    if @test.save
      flash[:success] = 'Sprawdzian zapisano.'
      redirect_to tests_path
    else
      flash[:danger] = 'Ups.. uzupełnij temat aby kontynuować.'
      redirect_to new_test_path
    end
   end
   
  def edit
  end
   
  def update
    if @test.update(tests_params)
      flash[:success] = 'Sprawdzian zaktualizowany.'
      redirect_to tests_path 
    else
      flash[:danger] = 'Coś poszło nie tak, spróbuj jeszcze raz.'
      render :edit
    end
  end
   
  def destroy
    @test.destroy
    flash[:danger] = 'Sprawdzian usunięty.'
    redirect_to tests_path
  end
   
  private
  def tests_params
    params.require(:test).permit(:subject, :topic, :date)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end