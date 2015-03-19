class Event < ActiveRecord::Base
	require 'validators.rb'
	belongs_to :conference
	belongs_to :speaker
	belongs_to :event_type

	has_attached_file :materials

	validates :title, presence: true
	validates :conference_id, presence: true
	validates :event_type_id, presence: true
	# validates_with Validators::EventSpeakerValidator, on: [:create, :update]

	do_not_validate_attachment_file_type :materials

	def self.get_new_position conference_id
		return 0 unless conference_id
		positions = Event.where(conference_id: conference_id).pluck(:position).compact
		# raise "#{conference_id},#{positions}"
		return 1 if positions.count == 0
		new_position = positions.max + 1		
	end

end
	