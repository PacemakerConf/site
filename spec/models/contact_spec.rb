require 'rails_helper'
require 'shoulda/matchers'


describe Contact do
	

	it "should be valid with name, surname and location_id" do
 	   contact = Contact.new(
       name: 'Vad',
       surname: 'Kirdan',
       location_id: 1)
     expect(contact).to be_valid
 	end

 	it "should be invalid without name" do
	 contact = Contact.new(name: nil)
 	 contact.valid?
     expect(contact.errors[:name]).to include("can't be blank")
	end

	it "should be invalid without surname" do
	 contact = Contact.new(surname: nil)
 	 contact.valid?
     expect(contact.errors[:surname]).to include("can't be blank")
	end

	it "should be invalid without location_id" do
	 contact = Contact.new(location_id: nil)
 	 contact.valid?
     expect(contact.errors[:location_id]).to include("can't be blank")
	end

	it "should be valid without email and skype" do
	   contact = Contact.new(
		  name: 'Vad',
       	  surname: 'Kirdan',
       	  email: nil,
       	  skype: nil,
          location_id: 1)
 	   expect(contact).to be_valid
	end

	it { should belong_to(:location) }
 	
end