module SpeakersHelper

	def invite_message
		Message.first.content
	end

end
