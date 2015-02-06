require 'rails_helper'
require 'shoulda/matchers'

describe Location do

	before do
		@location = Location.new(address: 'Pasternaka 5, Lviv', conference_id: 1, latitude: 49.8327337, longitude: 23.9992261)
	end
	
	it "should be valid with address and conference_id" do
     expect(@location).to be_valid
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
  	it { should have_many(:contacts) }
	
end