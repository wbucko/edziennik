class TestsController < ApplicationController
    before_filter :admin_verify
    
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
       @test = Test.find(params[:id])
   end
   
   def update
       @test = Test.find(params[:id])
       if @test.update(tests_params)
          redirect_to tests_path, notice: 'Sprawdzian zaktualizowany.' 
       else
          render :edit, notice: 'Coś poszło nie tak, spróbuj jeszcze raz.' 
       end
   end
   
   def destroy
       @test = Test.find(params[:id])
       @test.destroy
       redirect_to tests_path, notice: 'Sprawdzian usunięty.'
   end
   
   private
   def tests_params
      params.require(:test).permit(:subject, :topic, :date)
   end
end