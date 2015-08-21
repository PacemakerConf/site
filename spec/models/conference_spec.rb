require 'rails_helper'
require 'shoulda/matchers'

describe Conference do 

	before :each do
		admin = FactoryGirl.create(:admin)
	end

	it { should have_many(:speakers) }
	it { should have_many(:events) }
	it { should have_one(:location) }
	it { should have_one(:report) }
	it { should belong_to(:year) }

	it 'is has valid factory' do
		expect(FactoryGirl.create(:conference)).to be_valid
	end
	
	it { should validate_presence_of(:name) }

	it { should validate_presence_of(:year_id) }

	it 'return conference\'s name-year ' do
		year2013 = FactoryGirl.create(:year)
		conference = FactoryGirl.create(:conference, year: year2013)
		expect( conference.fullname ).to eq(conference.name.to_s + '-' + conference.year.name.to_s)
	end

	it 'return last conference fullname' do
		year2013 = FactoryGirl.create(:year, name: 2013)
		year2015 = FactoryGirl.create(:year, name: 2015)

		first = FactoryGirl.create(:conference, name: 'first', year: year2013, date: '2013-12-12', published: true)
		second = FactoryGirl.create(:conference, name: 'second', year: year2015, date: '2015-01-12', published: true)
		third = FactoryGirl.create(:conference, name: 'third', year: year2015, date: '2015-11-10', published: false)
		expect( Conference.last_conference_route).to eq('second-2015/about')
	end
end