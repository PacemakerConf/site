require 'faker'

FactoryGirl.define do 
	factory :invitation do |f|
		f.email Faker::Internet.email
		f.status "Sent"
		f.conference_id 1
		f.message_id 1

 	end
end 