class EventType < ActiveRecord::Base
	has_many :events

	validates :name, presence: true, uniqueness: true
	validates :default_duration, presence: true

	scope :by_name, -> { order(name: :asc) }  
end