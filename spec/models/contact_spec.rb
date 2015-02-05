require 'rails_helper'
require 'shoulda/matchers'


describe Contact do

	before do
	  @contact = Contact.new(name: 'Vad', surname: 'Kirdan', email: 'vad_gmail.com', skype: 'vad', location_id: 1)
	end

	it "should be valid with name, surname and location_id" do
      expect(@contact).to be_valid
 	end

 	it "should be invalid without name" do
	  @contact.name = nil
      expect(@contact).not_to be_valid
	end

	it "should be invalid without surname" do
	  @contact.surname = nil
      expect(@contact).not_to be_valid
	end

	it "should be invalid without location_id" do
	  @contact.location_id = nil
      expect(@contact).not_to be_valid
	end

	it "should be valid without email and skype" do
	  @contact.email = nil
	  @contact.skype = nil
 	  expect(@contact).to be_valid
	end

	it { should belong_to(:location) }
 	
end