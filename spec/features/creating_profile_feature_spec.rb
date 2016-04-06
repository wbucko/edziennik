require 'rails_helper'
require 'support/macros'

RSpec.feature "Creating Profile" do 
	let(:user) { Fabricate(:user) }
	before { sign_in_as user }

	scenario 'a successful creation of an user profile' do 
		visit root_path

		fill_in :profile_first_name, with: 'John'
		fill_in :profile_last_name, with: 'Doe'
		attach_file :profile_avatar, "app/assets/images/128.jpg"
		fill_in :profile_year, with: 2

		click_button 'Zapisz'

		expect(page).to have_content("Profil utworzony!")
	end
	scenario 'an unsuccessful creation of an user profile' do 
		visit root_path

		fill_in :profile_first_name, with: nil
		fill_in :profile_last_name, with: 'Doe'
		attach_file :profile_avatar, "app/assets/images/128.jpg"
		fill_in :profile_year, with: 2

		click_button 'Zapisz'

		expect(page).to have_content('Poprawnie uzupełnij wszystkie pola!')
	end
end