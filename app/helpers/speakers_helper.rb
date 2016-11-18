module SpeakersHelper

	def invite_message
		Message.first.content
	end

  def make_searched_part_bold string, input 
    if string.to_s.downcase.index(input).to_s == '0'
      result = string.dup.to_s
      result.insert(input.length, '</b>')
      result = '<b>' + result
    else
      result = string.to_s
    end
  end

	def create_speaker_list speakers, input = ''
    return speakers_list = '' if input == ''
    speakers_list = '<ul class="speakers-list">'
    speakers.each do |speaker|
      name = make_searched_part_bold(speaker.name, input)
      surname = make_searched_part_bold(speaker.surname, input)
      speakers_list += '<li onclick="setSpeaker(' + speaker.id.to_s + 
      ', \'' + speaker.fullname.gsub("'", "\\'").gsub('"', '\\"')  + '\')">' + name.to_s + ' ' + 
      surname + '</li>'
    end
    speakers_list += '</ul>'
    speakers_list
	end
end
