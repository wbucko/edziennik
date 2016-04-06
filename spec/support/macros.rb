def sign_in_as(user)
	visit root_path
	click_link "Zaloguj"

	fill_in :user_email, with: user.email 
	fill_in :user_password, with: user.password 

	click_button "Zaloguj"
	expect(page).to have_content("Signed in successfully.")
end