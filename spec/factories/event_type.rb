FactoryGirl.define do 
	factory :event_type do |f| 
		f.name Faker::Lorem.word
		f.speaker_event false
		f.default_duration "2014-12-12 00:30:00"
 	end
end