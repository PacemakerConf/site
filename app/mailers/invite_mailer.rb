class InviteMailer < ActionMailer::Base
	default from: "sysstemtest@gmail.com",
		template_path: 'mailers'

	def speaker_invite(email, message)
	@message = message
		mail( to: email, subject: "Invitation for registration") do |format|
			format.html { render 'mailers/speaker_invite' }
		end	
	end
	
end
