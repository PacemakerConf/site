class Speaker < ActiveRecord::Base
	has_many :events
	has_many :conferences, through: :events

	validates :name, presence: true
	
end
