class Conference < ActiveRecord::Base
	has_many :events
	has_many :speakers, through: :events

	has_one :location

	validates :name, presence: true

end
