class SpeakerRequestMailer < ActionMailer::Base
	default to: Proc.new { Admin.pluck(:email) }
	def send_mail(name, email, comment)
		@name = name
	  @email = email
		@comment = comment
		mail(from: "sysstemtest@gmail.com", subject: "Request to be a speaker") do |format|
		format.html { render 'mailers/speaker_request' }
		format.text { render 'mailers/speaker_request' }
		end	
	end
end