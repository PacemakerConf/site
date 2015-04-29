module Validators
	class ConferenceYearDateValidator < ActiveModel::Validator
		def validate(record)
			date = record.date
			year_id = record.year_id
			
			if date
				unless date.year.to_s === Year.find(year_id).name.to_s
					record.errors[:date] << 'must be in accordane with year'
					record.errors[:year_id] << 'must be in accordane with date'
				end
			end
		end
	end
end