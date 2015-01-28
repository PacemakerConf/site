require 'rails_helper'
require 'shoulda/matchers'


describe Location  do
	
	it "should do something" do
		expect(1+1).to eq(2)
	end

	it 'should belong to conference' do
		location = FactoryGirl.build(:location)
		expect(location).to belong_to(:user)
	end	
	
end