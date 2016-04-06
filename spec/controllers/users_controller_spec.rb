require 'rails_helper'

RSpec.describe UsersController, type: :controller do 
	let(:user) { Fabricate(:user) }

	describe "GET #show" do 
		context 'authorized user' do 
			before { sign_in user } 

			it 'returns successful http request status code' do 
				get :show, id: user

				expect(response).to have_http_status(:success)
			end
		end
		context 'unauthorized user' do 
			it 'redirects to user sign in page' do 
				get :show, id: user 

				expect(response).to redirect_to new_user_session_path
			end
		end
	end

	describe "GET #index" do 
		context 'authorized user' do 
			before { sign_in user }

			it 'returns successful http request status code' do 
				get :index

				expect(response).to have_http_status(:success)
			end
		end
		context 'unauthorized user' do 
			it 'redirects to user sign in page' do 
				get :index 

				expect(response).to redirect_to new_user_session_path
			end
		end
	end
end