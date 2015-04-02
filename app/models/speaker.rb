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
	#validates_format_of :email, :multiline => true, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

	validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  default_scope { order(id: :asc) }
  scope :by_name_and_surname, lambda{|input, splitted_input| where("name ILIKE '#{input}%' or surname ILIKE '#{input}%' or (name ILIKE '#{splitted_input[0]}%' and surname ILIKE '#{splitted_input[1]}%') or (surname ILIKE '#{splitted_input[0]}%' and name ILIKE '#{splitted_input[1]}%')").limit(5) } 

	def fullname
		[name, surname].join ' '
	end

	def self.search input
    splitted_input = input.split(' ')
    speakers = Speaker.by_name_and_surname(input, splitted_input)
    @speakers_list = Admin::SpeakersController.helpers.create_speaker_list(speakers, input)
  end

end
