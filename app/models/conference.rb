class Conference < ActiveRecord::Base
	require 'validators.rb'
  
	has_many :events
	has_many :speakers, through: :events
	has_many :news

	has_one :location
	has_one :report

	belongs_to :year	

	validates :name, presence: true
	validates :year_id, presence: true
	validates :date, inclusion: { in: Time.now..Time.new(2100)} if 
		StrictValidation.enabled?
					 
	# validates_with Validators::ConferenceUniquenessValidator, on: [:create, :update]
					 
	def fullname
		name.to_s + "-" + year.name.to_s
	end

	def route
		name.to_s + "-" + year.name.to_s
	end

	def self.last_conference_route
		last_conference = Conference.where(published: true).order(date: :desc)[0]
		if last_conference
			last_conference.name.to_s + '-' + last_conference.year.name.to_s + '/about'
		else 
			'fake_route'
		end
	end		
end

