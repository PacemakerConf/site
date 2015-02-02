class Conference < ActiveRecord::Base
	has_many :events
	has_many :speakers, through: :events

	has_one :location

	validates :name, presence: true
	validates :year, presence: true,
					 inclusion: { in: 2011..2100 }

end
