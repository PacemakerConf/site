require 'rails_helper'
require 'shoulda/matchers'

describe Message do
	it {should have_many(:invitation) }
 	
 	it "should have valid factory" do
   	expect(FactoryGirl.create(:message)).to be_valid
 	end

 	it "should be invalid withot token $${link_invitation}" do
 		expect(FactoryGirl.build(:message, content:"Msg without token")).not_to be_valid
 	end
end
