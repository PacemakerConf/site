require 'rails_helper'
require 'shoulda/matchers'

describe Speaker do
	
	it {should have_many(:events) }
	it {should have_many(:conferences) }

	it 'has valid factory' do
		expect(FactoryGirl.create(:speaker)).to be_valid
	end

	it 'is invalid without name' do
		expect(FactoryGirl.build(:speaker, name: nil)).not_to be_valid
	end

	it 'is invalid without position' do
		expect(FactoryGirl.build(:speaker, position: nil)).not_to be_valid
	end

	it 'is invalid without description' do
		expect(FactoryGirl.build(:speaker, description: nil)).not_to be_valid
	end

	it 'is invalid without surname' do
		expect(FactoryGirl.build(:speaker, surname: nil)).not_to be_valid
	end 

	it 'return speakers full name ' do
		speaker = FactoryGirl.build(:speaker)
		expect( speaker.fullname ).to eq(speaker.name.to_s + ' ' + speaker.surname.to_s)
	end
end
