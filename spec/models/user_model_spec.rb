require 'rails_helper' 

RSpec.describe User, type: :model do 
	it { should have_one(:profile).dependent(:destroy) }
	it { should have_many(:grades).dependent(:destroy) }
end