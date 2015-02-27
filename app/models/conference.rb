class Conference < ActiveRecord::Base
  
	has_many :events
	has_many :speakers, through: :events

	has_one :location

	validates :name, presence: true
	validates :year, presence: true,
					 inclusion: { in: 2011..2100 }
					 
	def fullname
		name.to_s + "-" + year.to_s
	end

	def route
		name.to_s + "-" + year.to_s
	end

	def self.last_conference_route
		if Conference && Conference.first
			last_conference = Conference.order(date: :desc)[0]
			last_conference.name.to_s + '-' + last_conference.year.to_s
		else
			'1'
		end
	end		
end

