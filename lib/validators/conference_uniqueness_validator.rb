module Validators
	class ConferenceUniquenessValidator < ActiveModel::Validator
		def validate(record)
			name = record.name
			year = record.year

			if( Conference.where(name: name, year: year) ) 
				record.errors[:name] << 'already exist with this year'
			end
		end
	end
end