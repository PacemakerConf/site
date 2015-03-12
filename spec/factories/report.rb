require 'faker'

FactoryGirl.define do 
	factory :report do |f| 
		f.title Faker::Lorem.word
		f.description Faker::Lorem.paragraphs
 	end
end