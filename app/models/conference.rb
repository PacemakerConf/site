class Conference < ActiveRecord::Base
	require 'validators.rb'

	has_many :speakers, through: :events
	has_many :events, dependent: :destroy
	has_many :news, dependent: :destroy
	has_one :location, dependent: :destroy
	has_one :report, dependent: :destroy
	belongs_to :year	

	validates :name, presence: true,
									 format: { with: /\A[\w& ]+\z/}
	validates :year_id, presence: true
	validates :date, inclusion: { in: Time.now..Time.new(Year::LAST_YEAR)} if 
		StrictValidation.enabled?
	validates_with Validators::ConferenceYearDateValidator, on: [:create, :update]
	# validates_with Validators::ConferenceUniquenessValidator, on: [:create, :update]
	scope :by_date_asc, -> { order(date: :asc) }
	scope :by_year_date_desc, -> { order(date: :desc) }
					 
	def fullname
		name.to_s + "-" + year.name.to_s
	end

	def route
		name.to_s + '-' + year.name.to_s
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