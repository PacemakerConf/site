require 'rails_helper'
require 'shoulda/matchers'


describe Location do
	
	it "should do something" do
		expect(1+1).to eq(2)
	end

	#it 'should belong to conference' do
		#location = FactoryGirl.build(:location)
		#expect(location).to belong_to(:user)
	#end	

	it "should be valid with address and conference_id" do
 	   location = Location.new(
       address: 'Pasternaka 5, lviv',
       conference_id: 1)
     expect(location).to be_valid
 	end

 	it "should be invalid without an address" do
	   location = Location.new(address: nil)
 	   location.valid?
     expect(location.errors[:address]).to include("can't be blank")
	end

	it "should be invalid without an conference_id" do
	   location = Location.new(conference_id: nil)
 	   location.valid?
     expect(location.errors[:conference_id]).to include("can't be blank")
	end

	it "should be valid without latitude and longitude" do
	   location = Location.new(
		   address: 'Pasternaka 5, lviv',
		   latitude: nil,
		   longitude: nil,
		   conference_id: 1)
 	   expect(location).to be_valid
	end

	#it "should be invalid with a duplicate address" do
      #Contact.create(
      #address: 'Pasternaka 5, lviv')
   	  #contact = Contact.new(
      #address: 'Pasternaka 5, lviv')
  	  #contact.valid?
      #expect(contact.errors[:address]).to include("has already been taken")
 	#end

 	it { should belong_to(:conference) }

 	#it "should have many contacts" do
    	#location = Location.reflect_on_association(:contacts)
    	#location.macro.should == :has_many
  	#end

  	it { should have_many(:contacts) }
	
end