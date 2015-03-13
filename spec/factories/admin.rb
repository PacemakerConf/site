<<<<<<< HEAD
require 'faker'

FactoryGirl.define do 
	factory :admin do |f|
		f.username Faker::Name.name 
		f.password 'very_secret'
		f.email Faker::Internet.email 
	end
end
=======
>>>>>>> kirdan
