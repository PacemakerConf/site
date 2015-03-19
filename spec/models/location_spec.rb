require 'rails_helper'
require 'shoulda/matchers'

describe Location do
	
	it "should have valid factory" do
   	   expect(FactoryGirl.create(:location)).to be_valid
 	end

 	it "should be invalid without an address" do
 	   expect(FactoryGirl.build(:location, address: nil)).not_to be_valid
	end

	it "should be invalid without city" do
 	   expect(FactoryGirl.build(:location, city: nil)).not_to be_valid
	end

	it "should be valid without latitude" do
 	   expect(FactoryGirl.build(:location, latitude: nil)).to be_valid
	end
    
    it "should be valid without longitude" do
 	   expect(FactoryGirl.build(:location, longitude: nil)).to be_valid
	end 

 	it { should belong_to(:conference) }
  	it { should have_and_belong_to_many(:contacts) }
	
end