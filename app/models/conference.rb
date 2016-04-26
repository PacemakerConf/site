class Conference < ActiveRecord::Base
  require 'validators.rb'

  has_many :speakers, through: :events
  has_many :events, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_one :location, dependent: :destroy
  has_one :report, dependent: :destroy
  belongs_to :year

  validates :name, presence: true,
                   format: { with: /\A[\.\w& ]+\z/ }
  validates :year_id, presence: true
  validates :date, inclusion: { in: Time.now..Time.new(Year::LAST_YEAR)}, if: :apply_date_validation?
  validates_with Validators::ConferenceYearDateValidator, on: [:create, :update]

  scope :by_date_asc, -> { order(date: :asc) }
  scope :by_year_date_desc, -> { includes(:year).order('years.name desc', date: :desc) }
  scope :future, -> { where(date: Time.now..Time.new(Year::LAST_YEAR)) }

  def apply_date_validation?
    Configuration.apply_date_validation?
  end

  def fullname
    name.to_s + "-" + year.name.to_s
  end

  def route
    name.to_s + '-' + year.name.to_s
  end


	def self.last_conference_route
		last_conference = Conference.where(published: true).by_year_date_desc[0]#order(year: :desc, date: :desc)[0]
		if last_conference
			last_conference.name.to_s + '-' + last_conference.year.name.to_s + '/about'
		else
			'not found'
		end
	end

  def self.year(val)
    # TODO write tests
    if val.kind_of? Year
      where(year: val)
    else
      joins(:year).where(years: { name: val.to_s })
    end
  end

  def self.nearest
    where('date > ?', Time.current).order(date: :asc).first
  end

  def self.find_by_route(route)
    name, year = route.split('-')
    Conference.find_by(
      name: name,
      year: Year.find_by(name: year)
    )
  end

  def has_news?
    # TODO write tests
    news.count > 0
  end

  def next_conference
    # TODO write tests
    self.class.where('date > ?', date).order(date: :asc).first
  end

  def previous_conference
    # TODO write tests
    self.class.where('date < ?', date).order(date: :desc).first
  end
end
