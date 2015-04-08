class Speaker < ActiveRecord::Base

	has_many :events
	has_many :conferences, through: :events

	has_attached_file :photo, styles: {
		thumb: '150x150>',
		medium: '300x300>'
	}

	validates :name, presence: true
	validates :surname, presence: true
	validates :description, presence: true
  validates :email, presence: true, 
                    uniqueness: true

  validates_format_of :email, :multiline => true, :with => /^\w+@\w+\.[a-z]+$/i

	validates_attachment_content_type :photo, 
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :by_name_and_surname, lambda { |input, splitted_input| 
    where("name LIKE '#{input}%' or surname LIKE '#{input}%' or 
      (name LIKE '#{splitted_input[0]}%' and surname LIKE 
      '#{splitted_input[1]}%') or (surname LIKE '#{splitted_input[0]}%'
      and name LIKE '#{splitted_input[1]}%')").limit(5) 
    } 

	def fullname
		[name, surname].join ' '
	end

	def self.search input
    splitted_input = input.split(' ')
    speakers = Speaker.by_name_and_surname(input, splitted_input)
    @speakers_list = Admin::SpeakersController.helpers.create_speaker_list(speakers, input)
  end

  def get_sorted_events
    sorted_events = [] 
    self.events.each do |event| 
      sorted_events << {date: event.conference.date || Date.new(Year::LAST_YEAR), event: event} 
    end 
    sorted_events.sort_by!{|obj| obj[:date]}.reverse!
  end

end
