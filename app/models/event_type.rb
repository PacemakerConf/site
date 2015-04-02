class EventType < ActiveRecord::Base
	has_many :events

	validates :name, presence: true, 
				 					 uniqueness: true
	validates :defaultDuration, presence: true

  default_scope { order(id: :asc) }
  
end