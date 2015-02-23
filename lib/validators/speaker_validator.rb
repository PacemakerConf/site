module Validators
	class SpeakerValidator < ActiveModel::Validator
		def validate(record)
			if( record.event_type.speakerEvent.to_i === 0 && record.speaker_id ) 
				record.errors[:speaker_id] << 'error: you can\'t choose speaker to this eventtype'
			end

			if( record.event_type.speakerEvent.to_i === 1 && !record.speaker_id )
				record.errors[:speaker_id] <<  'error: you have to choose speaker to TOPIC or LIGHTNING event'
			end
		end
	end
end