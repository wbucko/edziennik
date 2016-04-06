require 'rails_helper' 

RSpec.describe Grade, type: :model do 
	it { should belong_to(:user) }
	it { should belong_to(:test) }

	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:test_id) }
	it { should validate_presence_of(:result) }
	it { should validate_uniqueness_of(:user_id).scoped_to(:test_id) }
end