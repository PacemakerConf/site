module Validators
	class ConferenceYearDateValidator < ActiveModel::Validator
		def validate(record)
			date = record.date
			year_id = record.year_id
			
			if date
				if date.year.to_s != Year.find(year_id).name.to_s
					record.errors[:date] << 'must be in accordane with year'
				end
			end
		end
	end
end