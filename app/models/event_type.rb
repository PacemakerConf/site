class EventType < ActiveRecord::Base
		has_many :events

		validates :name, presence: true
		validates :defaultDuration, presence: true

end