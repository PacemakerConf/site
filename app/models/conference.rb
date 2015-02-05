class Conference < ActiveRecord::Base
  
	has_many :events
	has_many :speakers, through: :events

	has_one :location

	validates :name, presence: true
	validates :year, presence: true,
					 inclusion: { in: 2011..2100 }

  
  #	def self.last_conference
  #		last_conference = Conference.order(date: :desc)[0]
  #		last_conference.name.to_s + '-' + last_conference.year.to_s
  #	end
		
end
