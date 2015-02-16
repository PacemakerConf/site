class InviteMailer < ActionMailer::Base
	default from: "sysstemtest@gmail.com",
		template_path: 'mailers'

	def speaker_invite
		mail to: 'mywe4ka@gmail.com',
		subject: "Hi"
	end

end
