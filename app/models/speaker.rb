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

  # scope :by_name_and_surname, (lambda do |search_phrase|
  #   search_text = search_phrase.split(/\s/).collect{ |pattern| 
  #     "name ILIKE '#{pattern}%' or surname IzLIKE '#{pattern}%'"
  #   }.join(" OR ")  
  #   where(search_text).limit(5)
  # end)

	def fullname
		[name, surname].join ' '
	end

	def self.search pattern
		speakers_list = '<ul class="speakers-list">'
    speakers = Speaker.where("name ILIKE '#{pattern}%' or surname ILIKE '#{pattern}%'").limit(5)
    speakers.each do |speaker|
      if speaker.name.to_s.downcase.index(pattern).to_s == '0'
        name = speaker.name.to_s
        name.insert(pattern.length, '</b>')
        name = '<b>' + name
      else
        name = speaker.name.to_s
      end
      if speaker.surname.to_s.downcase.index(pattern).to_s == '0'
        surname = speaker.surname.to_s
        surname.insert(pattern.length, '</b>')
        surname = '<b>' + surname
      else
        surname = speaker.surname.to_s
      end
        
      speakers_list += '<li onclick="setSpeaker(' + speaker.id.to_s + 
        ', \'' + speaker.fullname + '\')">' + name.to_s + ' ' + surname + '</li>'
    end
    speakers_list == '</ul>'
    speakers_list = '' if pattern == ''
    speakers_list
  end

end
