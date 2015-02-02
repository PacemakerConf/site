require 'rails_helper'
require 'shoulda/matchers'

describe Conference do 

	it { should have_many(:speakers) }
	it { should have_many(:events) }
	it { should have_one(:location) }

	before do
		@conference = Conference.new(name: 'RoR', year: 2030)
	end

	it 'should be valid with name and yeaer' do
		expect(@conference).to be_valid
	end
	
	it 'should be invalid without name' do
		@conference.name = nil
		expect(@conference).not_to be_valid
	end
	
	it 'should be invalid without year' do
		@conference.year = nil
		expect(@conference).not_to be_valid
	end

	it 'should be invalid with wrong year' do
		@conference.year = 215
		expect(@conference).not_to be_valid
	end

end
