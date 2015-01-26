class Event < ActiveRecord::Base
	belongs_to :conference
	belongs_to :speaker
	belongs_to :events_type

	validates :title, presence: true
	validates :conference_id, presence: true
	validates :events_type_id, presence: true

end
	