FactoryGirl.define do 
	factory :user do |f|
		f.role User::GUEST
	end
end