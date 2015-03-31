require 'faker'

FactoryGirl.define do 
	factory :invitation do |f|
		f.email Faker::Internet.email
		f.status "New"
		f.conference_id 1
		f.message_id 1

 	end
end 