require 'faker'

FactoryGirl.define do 
	factory :conference do |f| 
		f.name Faker::Lorem.word 
		f.year 2020
 	end
end