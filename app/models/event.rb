class Event < ActiveRecord::Base
	belongs_to :conference
	belongs_to :speaker
	belongs_to :event_type

	validates :title, presence: true
	validates :conference_id, presence: true
	validates :event_type_id, presence: true

end
	