require 'rails_helper'
require 'shoulda/matchers'

describe Conference do 

	it { should have_many(:speakers) }
	it { should have_many(:events) }
	it { should have_one(:location) }

	it 'is has valid factory' do
		expect(FactoryGirl.create(:conference)).to be_valid
	end
	
	it { should validate_presence_of(:name) }

	it { should validate_presence_of(:year) }

	it { should validate_inclusion_of(:year).in_range(2011..2100) }

	it 'return conference\'s full name ' do
		conference = FactoryGirl.build(:conference)
		expect( conference.fullname ).to eq(conference.name.to_s + '-' + conference.year.to_s)
	end

	it 'return last conference fullname' do
		first = FactoryGirl.create(:conference, name: 'first', year: 2013, date: '2013-12-12')
		third = FactoryGirl.create(:conference, name: 'third', year: 2015, date: '2015-11-10')
		second = FactoryGirl.create(:conference, name: 'second', year: 2015, date: '2015-01-12')
		expect( Conference.last_conference_route).to eq('third-2015')
	end
end