module Validators
	class EventSpeakerValidator < ActiveModel::Validator
		def validate(record)
			if( record && record.event_type && !record.event_type.speakerEvent && record.speaker_id ) 
				record.errors[:speaker_id] << 'error: you can\'t choose speaker to this eventtype'
			end

			if( record && record.event_type && record.event_type.speakerEvent && !record.speaker_id )
				record.errors[:speaker_id] <<  'error: please, start typing speakers name and select speaker from the list'
			end
		end
	end
end