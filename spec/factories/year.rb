require 'faker'

FactoryGirl.define do 
	factory :year do |f| 
		f.name 2020
		f.published true

		factory :unpublished_year do
			published false
		end
 	end
end