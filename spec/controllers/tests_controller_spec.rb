require 'rails_helper'
require 'support/shared_examples'

RSpec.describe TestsController, type: :controller do 
	let(:admin) { Fabricate(:admin) }
	let(:test) { Fabricate(:test) }
	before { sign_in admin }

	describe "GET #index" do 
		context 'not admin user' do 
			it_behaves_like "requires admin" do 
				let(:action) { get :index }
			end
		end
		context 'an admin user' do 
			it 'returns a success http status code' do 
				get :index

				expect(response).to have_http_status(:success)
			end
		end
	end

	describe "GET #new" do 
		context 'non admin user' do
			it_behaves_like "requires admin" do 
				let(:action) { get :new }
			end
		end
		context 'an admin users' do 
			it 'returns a success http status code' do 
				get :new

				expect(response).to have_http_status(:success)
			end
		end
	end

	describe "POST #create" do 
		context 'non admin users' do 
			it_behaves_like "requires admin" do 
				let(:action) { post :create }
			end
		end
		context 'admin users' do 
			context 'a successful create' do 
				before do 
					post :create, test: Fabricate.attributes_for(:test)
				end

				it 'saves new test object' do 
					expect(Test.count).to eq(1)
				end

				it 'sets a successful flash message' do 
					expect(flash[:success]).to eq('Sprawdzian zapisano.')
				end

				it 'redirects to tests path' do 
					expect(response).to redirect_to tests_path
				end
			end
			context 'an unsuccessful create' do 
				before do 
					post :create, test: Fabricate.attributes_for(:test, topic: nil)
				end

				it 'does not save a new object' do 
					expect(Test.count).to eq(0)
				end

				it 'sets a danger flash message' do 
					expect(flash[:danger]).to eq('Ups.. uzupełnij temat aby kontynuować.')
				end
			end
		end
	end

	describe "GET #edit" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { get :edit, id: test }
			end
		end
		context 'admin users' do 
			it 'returns a success http status code' do 
				get :edit, id: test 

				expect(response).to have_http_status(:success)
			end
		end
	end

	describe "PUT #update" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { get :edit, id: test }
			end
		end
		context 'admin users' do
			context 'a successful update' do 
				before do 
					put :update, test: Fabricate.attributes_for(:test, topic: 'Barok'), id: test.id 
				end

				it 'updates an object with a given id' do 
					expect(Test.last.topic).to eq("Barok")
					expect(Test.last.topic).not_to eq('Renesans')
				end

				it 'sets a successful flash message' do 
					expect(flash[:success]).to eq('Sprawdzian zaktualizowany.')
				end

				it 'redirects to tests path' do 
					expect(response).to redirect_to tests_path
				end
			end
			context 'an unsuccessful update' do 
				before do 
					put :update, test: Fabricate.attributes_for(:test, topic: nil), id: test.id 
				end

				it 'does not save test object' do 
					expect(Test.last.topic).to eq('Renesans')
				end

				it 'sets the danger flash message' do 
					expect(flash[:danger]).to eq('Coś poszło nie tak, spróbuj jeszcze raz.')
				end
			end
		end
	end

	describe "DELETE #destroy" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { delete :destroy, id: test }
			end
		end
		context 'admin users' do
			before { delete :destroy, id: test }

			it 'removes object with a given id' do
				expect(Test.count).to eq(0)
			end

			it 'sets the success flash message' do 
				expect(flash[:success]).to eq('Sprawdzian usunięty.')
			end

			it 'redirects to tests path' do 
				expect(response).to redirect_to tests_path 
			end
		end
	end
end