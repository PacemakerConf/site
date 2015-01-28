class EventsType < ActiveRecord::Base
	has_many :events

	validates :eventstype, presence: true

end
