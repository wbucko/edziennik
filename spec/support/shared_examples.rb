shared_examples "requires sign in" do 
	it "redirects to the root path" do 
		sign_out
		action
		expect(response).to redirect_to root_path
	end
end

shared_examples "requires admin" do 
	it "redirects to the home page for non admin users" do 
		sign_out admin
		action
		expect(response).to redirect_to root_path
	end
end