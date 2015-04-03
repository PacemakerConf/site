class Event < ActiveRecord::Base
	require 'validators.rb'
	belongs_to :conference
	belongs_to :speaker
	belongs_to :event_type

	has_attached_file :materials#,
										#storage: :dropbox,
										#dropbox_credentials: Rails.root.join("config/dropbox.yml")

	validates :title, presence: true
	validates :conference_id, presence: true
	validates :event_type_id, presence: true
	validates_with Validators::EventSpeakerValidator, on: [:create, :update]

	do_not_validate_attachment_file_type :materials

	scope :by_position, -> { order("-position desc") }
	
	def self.get_new_position conference_id
		return 0 unless conference_id
		positions = Event.where(conference_id: conference_id).pluck(:position).compact
		return 1 if positions.count == 0
		new_position = positions.max + 1		
	end

	def self.change_position params
		position = params[:position].to_s.split(',')
    	id = params[:id].to_s.split(',')
	    begin
		  if position.length == id.length
	        for i in 1..id.length
	          id_temp = id[i-1].to_i
	          event_temp = Event.find(id_temp)
	          event_temp.position = position[i-1]
	          event_temp.save
	        end
	        return "Done" # Work with schedule.js ~90 line
	      else
	        return "Error: position and id length do not match."
	      end
	    rescue
	        return "Error: Event change position don't work properly."
	    end

	end

end
	