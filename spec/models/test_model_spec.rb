require 'rails_helper' 

RSpec.describe Test, type: :model do 
	it { should have_one(:grade).dependent(:destroy) }

	it { should validate_presence_of(:topic) }
	it { should validate_uniqueness_of(:topic) }
end