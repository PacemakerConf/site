require 'rails_helper'
require 'shoulda/matchers'

describe Invitation do
	
	it "should have valid factory" do
   	   expect(FactoryGirl.create(:invitation)).to be_valid
 	end

 	it "should be invalid without email" do
 	   expect(FactoryGirl.build(:invitation, email: nil)).not_to be_valid
	end

	it "should be invalid without conference_id" do
 	   expect(FactoryGirl.build(:invitation, conference_id: nil)).not_to be_valid
	end

	it "should be invalid without message_id" do
 	   expect(FactoryGirl.build(:invitation, message_id: nil)).not_to be_valid
	end

	it { should belong_to(:message) }

end