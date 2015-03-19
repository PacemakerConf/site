# class SpeakerRequest < ActionMailer::Base
# 	default to: "sysstemtest@gmail.com"

# 	def speaker_request(name, email)
#   # def speaker_request_email(name, email)
# 		@name = name
#         @email = email
# 		mail(from: email, subject: "I want to be a speaker: #{@user.email}") do |format|
# 			format.html { render 'mailers/speaker_request' }
# 			# layout 'mailer'
#     end
# 	end	
# end
         # subject: 'Call for Speaker',
         # template_path: 'notifications',
         # template_path: 'mailers',


         # template_name: 'request')

# class SpeakerRequest < ActionMailer::Base
#   def send_mail attrs
#     mail.body = attrs.body
#     mail.sender = attrs.sender
#     mail.deliver
#   end
# end
#   class ContactMailer < ActionMailer::Base
#     default to: # my email address
#     def contact_email(name, email, body)
#         @name = name
#         @email = email
#         @body = body`enter code here`
#         mail(from: email, subject: 'Contact Request')
#     end
# end