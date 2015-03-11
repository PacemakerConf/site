require 'faker'

FactoryGirl.define do 
	factory :speaker do |f| 
		f.name Faker::Name.first_name
		f.surname Faker::Name.last_name
		f.position Faker::Name.title
		f.description Faker::Lorem.paragraph

		factory :invalid_speaker do 
			name nil
		end

 	end
end