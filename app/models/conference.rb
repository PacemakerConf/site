class Conference < ActiveRecord::Base
	require 'validators.rb'
  
	has_many :events
	has_many :speakers, through: :events

	has_one :location
	has_one :report

	validates :name, presence: true
	validates :year, presence: true,
					 inclusion: { in: 2011..2100 }
	# validates_with Validators::ConferenceUniquenessValidator
					 
	def fullname
		name.to_s + "-" + year.to_s
	end

	def route
		name.to_s + "-" + year.to_s
	end

	def self.last_conference_route
		if Conference && Conference.first
			last_conference = Conference.where(published: true).order(date: :desc)[0]
			last_conference.name.to_s + '-' + last_conference.year.to_s + '/about'
		else
			'1'
		end
	end		
end

