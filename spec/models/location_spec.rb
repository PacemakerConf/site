require 'rails_helper'
require 'shoulda/matchers'

describe Location do
	
	it "should have valid factory" do
   	   expect(FactoryGirl.create(:location)).to be_valid
 	end

 	it "should be invalid without an address" do
	   @location.address = nil
 	   expect(@location).not_to be_valid
	end

	it "should be invalid without an conference_id" do
	   @location.conference_id = nil
 	   expect(@location).not_to be_valid
	end

	it "should be valid without latitude and longitude" do
	   @location.latitude = nil
	   @location.longitude = nil
 	   expect(@location).to be_valid
	end

 	it { should belong_to(:conference) }
  	it { should has_and_belongs_to_many(:contacts) }
	
end