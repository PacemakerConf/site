require 'rails_helper'
require 'shoulda/matchers'


describe Contact do

	it "should have valid factory" do
   	   expect(FactoryGirl.create(:contact)).to be_valid
 	end

 	it "should be invalid without name" do
 	   expect(FactoryGirl.build(:contact, name: nil)).not_to be_valid
	end

	it "should be invalid without surname" do
 	   expect(FactoryGirl.build(:contact, surname: nil)).not_to be_valid
	end

	it "should be invalid without telephone" do
 	   expect(FactoryGirl.build(:contact, telephone: nil)).not_to be_valid
	end

	it "should be invalid without email" do
 	   expect(FactoryGirl.build(:contact, email: nil)).not_to be_valid
	end

	it "should be invalid without skype" do
 	   expect(FactoryGirl.build(:contact, skype: nil)).not_to be_valid
	end

	it { should accept_nested_attributes_for(:emails) }
	it { should have_many(:emails).dependent(:destroy) }

	it { should have_and_belong_to_many(:locations) }
	it { should have_many(:emails) }

end