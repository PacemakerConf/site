module SpeakersHelper

	def invite_message
		Message.first.content
	end

	def create_speaker_list speakers, input = ''
		speakers_list = '<ul class="speakers-list">'
	  speakers.each do |speaker|
      if speaker.name.to_s.downcase.index(input).to_s == '0'
        name = speaker.name.dup.to_s
        name.insert(input.length, '</b>')
        name = '<b>' + name
      else
        name = speaker.name.to_s
      end
      if speaker.surname.to_s.downcase.index(input).to_s == '0'
        surname = speaker.surname.dup.to_s
        surname.insert(input.length, '</b>')
        surname = '<b>' + surname
      else
        surname = speaker.surname.to_s
      end
        
      speakers_list += '<li onclick="setSpeaker(' + speaker.id.to_s + 
        ', \'' + speaker.fullname + '\')">' + name.to_s + ' ' + surname + '</li>'
    end
    speakers_list += '</ul>'
    speakers_list = '' if input == ''
    speakers_list
	end
end
