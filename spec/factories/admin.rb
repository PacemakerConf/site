FactoryGirl.define do 
	factory :admin do |f|
		f.username 'adminstrator'
		f.password 'very_secret'
		f.email 'adminstrator@example.com'
	end
end