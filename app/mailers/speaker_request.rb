class SpeakerRequest < ActionMailer::Base
	default to: "markoshchutskyy@gmail.com"
	def send_mail(name, email)
		@name = name
	    @email = email
		mail(from: "sysstemtest@gmail.com", subject: "Speaker request") do |format|
		format.html { render 'mailers/speaker_request' }
		# layout 'mailer'
	end	
end

# class SpeakerRequest < ActionMailer::Base
#   def send_mail attrs
#     mail.body = attrs.body
#     mail.sender = attrs.sender
#     mail.deliver
#   end