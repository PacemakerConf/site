class Conference < ActiveRecord::Base
	require 'validators.rb'
  
	has_many :events
	has_many :speakers, through: :events

	has_one :location
	has_one :report

	validates :name, presence: true
	validates :year, presence: true,
					 inclusion: { in: 2011..2100 }
	# validates_with Validators::ConferenceUniquenessValidator, on: [:create, :update]
					 
	def fullname
		name.to_s + "-" + year.to_s
	end

	def route
		name.to_s + "-" + year.to_s
	end

	def self.last_conference_route
		last_conference = Conference.where(published: true).order(date: :desc)[0]
		if last_conference
			last_conference.name.to_s + '-' + last_conference.year.to_s + '/about'
		else 
			'fake_route'
		end
	end		
end

