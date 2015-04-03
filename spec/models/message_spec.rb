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

 	it "should have new version if content was changed" do
		msg = FactoryGirl.create(:message, version: 2)
 		expect(Message.set_last_version).to eq(3) 
 	end

 	it "should have zero version" do
		msg = FactoryGirl.build(:message, version: nil)
 		expect(Message.set_last_version).to eq(0) 
 	end

 	# it "should ..." do
 	# 	#msg1 = FactoryGirl.build(:message, content:"invalid withot token $${link_invitation}") 
 	# 	#msg2 = FactoryGirl.create(:message, content:" $${link_invitation}",  version: 2)
 	# 	expect((FactoryGirl.build(:message, content:"invalid withot token $${link_invitation}"))).create_if_new).to eq(msg1)
 	# end

end
