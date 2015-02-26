class Event < ActiveRecord::Base
	require 'validators.rb'
	belongs_to :conference
	belongs_to :speaker
	belongs_to :event_type

	has_attached_file :materials

	validates :title, presence: true
	validates :conference_id, presence: true
	validates :event_type_id, presence: true
	validates_with Validators::SpeakerValidator

	do_not_validate_attachment_file_type :materials

end
	