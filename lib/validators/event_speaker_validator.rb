module Validators
	class EventSpeakerValidator < ActiveModel::Validator
		def validate(record)
			if( record && record.event_type && !record.event_type.speakerEvent && record.speaker_id ) 
				record.errors[:speaker_id] << 'error: you can\'t choose speaker to this eventtype'
			end

			if( record && record.event_type && record.event_type.speakerEvent && !record.speaker_id )
				record.errors[:speaker_id] <<  'error: you have to choose speaker to TOPIC or LIGHTNING event'
			end
		end
	end
end