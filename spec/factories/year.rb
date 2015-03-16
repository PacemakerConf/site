require 'faker'

FactoryGirl.define do 
	factory :year do |f| 
		f.name Faker::Date.between(2000, 2100)
		f.published true

		factory :unpublished_year do
			published false
		end
 	end
end