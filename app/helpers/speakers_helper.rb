module SpeakersHelper

	def invite_message
		#Invitation::INVITE_MESSAGE
		Message.last.content
	end

end
