require 'rails_helper'
require 'support/shared_examples'

RSpec.describe GradesController, type: :controller do 
	let(:admin) { Fabricate(:admin) }
	let(:test) { Fabricate(:test) }
	let(:grade) { Fabricate(:grade, user_id: admin.id, test_id: test.id) }
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
					post :create, grade: Fabricate.attributes_for(:grade, user_id: admin.id, test_id: test.id)
				end

				it 'saves new grade object' do 
					expect(Grade.count).to eq(1)
				end

				it 'sets a successful flash message' do 
					expect(flash[:success]).to eq('Ocena zapisana.')
				end

				it 'redirects to grades path' do 
					expect(response).to redirect_to grades_path
				end
			end
			context 'an unsuccessful create' do 
				before do 
					post :create, grade: Fabricate.attributes_for(:grade, result: nil)
				end

				it 'does not save a new object' do 
					expect(Grade.count).to eq(0)
				end

				it 'sets a danger flash message' do 
					expect(flash[:danger]).to eq('Uzupełnij odpowiednie pola.')
				end
			end
		end
	end

	describe "GET #edit" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { get :edit, id: grade }
			end
		end
		context 'admin users' do 
			it 'returns a success http status code' do 
				get :edit, id: grade 

				expect(response).to have_http_status(:success)
			end
		end
	end

	describe "PUT #update" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { get :edit, id: grade }
			end
		end
		context 'admin users' do
			context 'a successful update' do 
				before do 
					put :update, grade: Fabricate.attributes_for(:grade, result: 4), id: grade.id 
				end

				it 'updates an object with a given id' do 
					expect(Grade.last.result).to eq(4)
					expect(Grade.last.result).not_to eq(5)
				end

				it 'sets a successful flash message' do 
					expect(flash[:success]).to eq('Ocena zaktualizowana!')
				end

				it 'redirects to grades path' do 
					expect(response).to redirect_to grades_path
				end
			end
			context 'an unsuccessful update' do 
				before do 
					put :update, grade: Fabricate.attributes_for(:test, result: nil), id: grade.id 
				end

				it 'does not save test object' do 
					expect(Grade.last.result).to eq(5)
				end

				it 'sets the danger flash message' do 
					expect(flash[:danger]).to eq('Uzupełnij wszystkie pola!')
				end
			end
		end
	end

	describe "DELETE #destroy" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { delete :destroy, id: grade }
			end
		end
		context 'admin users' do
			before { delete :destroy, id: grade }

			it 'removes object with a given id' do
				expect(Grade.count).to eq(0)
			end

			it 'sets the success flash message' do 
				expect(flash[:success]).to eq('Ocena usunięta.')
			end

			it 'redirects to grades path' do 
				expect(response).to redirect_to grades_path 
			end
		end
	end

	describe "GET #show" do 
		context 'non admin users' do 
			it_behaves_like 'requires admin' do 
				let(:action) { get :show, id: grade }
			end
		end

		context 'admin or owner user' do 
			it 'returns a successful http status code' do 
				get :show, id: grade 

				expect(response).to have_http_status(:success)
			end
		end
	end
end