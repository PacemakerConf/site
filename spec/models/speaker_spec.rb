require 'rails_helper'
require 'shoulda/matchers'

describe Speaker do
	
	it {should have_many(:events) }
	it {should have_many(:conferences) }

	it 'has valid factory' do
		expect(FactoryGirl.create(:speaker)).to be_valid
	end

	it { should validate_presence_of(:name) }

	it { should validate_presence_of(:surname) }
	
	it { should validate_presence_of(:position) }
	
	it { should validate_presence_of(:description) }
	
	it 'return speakers full name ' do
		speaker = FactoryGirl.build(:speaker)
		expect( speaker.fullname ).to eq(speaker.name.to_s + ' ' + speaker.surname.to_s)
	end
end
