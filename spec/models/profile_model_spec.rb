require 'rails_helper' 

RSpec.describe Profile, type: :model do 
	it { should belong_to(:user) }

	it { should validate_presence_of(:first_name) }
	it { should validate_presence_of(:last_name) }
	it { should validate_presence_of(:year) }
	it { should validate_inclusion_of(:year).in_range(1..4) }
end