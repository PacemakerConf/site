class Invitation < ActiveRecord::Base
	class LinkHelper
		include  ActionView::Helpers::UrlHelper
	end	
	INVITE_MESSAGE_TOKEN = '$${link_invitation}' 
	INVITE_MESSAGE_REGEXP = /\$\$\{\w+\}/
	INVITE_MESSAGE = <<-MESSAGE
Hi! You are invited for registration to the conference at our site! 
Your link is #{INVITE_MESSAGE_TOKEN}
Enjoy!
	MESSAGE

	def self.generate_link(email)
		cost = 10
		hash = ::BCrypt::Password.create("#{email}", :cost => cost).to_s
		LinkHelper.new.link_to('Click here to create profile', 
			"http://localhost:3000"+Rails.application.routes.url_helpers.new_speaker_path(hash: hash))
	end	
	def self.invite_speaker(email, message)
        # if params[:message].match(INVITE_MESSAGE_REGEXP)
		# insert link Speaker.generate_link(email), email, hash into invirations
	    message = message.gsub!(INVITE_MESSAGE_REGEXP, Invitation.generate_link(email))
	    InviteMailer.speaker_invite(email, message).deliver_later
	    
	end	


end
