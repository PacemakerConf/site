class SpeakerRequest < ActionMailer::Base
	default to: "markoshchutskyy@gmail.com"
			# layout 'mailer'
	def send_mail(name, email, message)
		@name = name
	    @email = email
		@message = message
		mail(from: "sysstemtest@gmail.com", subject: "Request to be a speaker") do |format|
		format.html { render 'mailers/speaker_request' }
		end	
	end
end

# class SpeakerRequest < ActionMailer::Base
#   def send_mail attrs
#     mail.body = attrs.body
#     mail.sender = attrs.sender
#     mail.deliver
#   end