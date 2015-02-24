FactoryGirl.define do 
	factory :event do |f| 
	  association :event_type, factory: :event_type
		f.title 'Beer-break'
		f.conference_id 1
 	end
end