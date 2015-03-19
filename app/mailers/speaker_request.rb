class SpeakerRequest < ActionMailer::Base
	default to: "markoshchutskyy@gmail.com"
			# layout 'mailer'
	def send_mail(name, email, message)
		@name = name
	    @email = email
		@message = message
		mail(from: "sysstemtest@gmail.com", subject: "Request to be a speaker") do |format|
		format.html { render 'mailers/speaker_request' }
		# format.text { render 'mailers/speaker_request' }
		end	
	end
end