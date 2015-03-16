require 'faker'

FactoryGirl.define do 
	factory :conference do |f| 
		f.name Faker::Lorem.word 
		f.year_id 1
 	end
end