require 'faker'

FactoryGirl.define do 
	factory :event do |f| 
	  association :event_type, factory: :event_type
		f.title Faker::Lorem.word
		f.conference_id 1
		f.duration '00:00:00'
 	end
end