FactoryGirl.define do 
	factory :location do |f| 
		f.city "Lviv" 
		f.address "Pasternaka 5"
		f.longitude 40.111111
		f.latitude 41.22222
		f.place_type "Hotel"
		f.name "Gold"
		f.how_to_find "Left, Right"
		f.conference_id 1
 	end
end