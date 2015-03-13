class Invitation < ActiveRecord::Base
	COST = 10
	belongs_to :message


	delegate :content, to: :message, prefix: true

	validates :email, presence: true
	#validates_associated :message

	#validates :email, email_format: { message: "doesn't look like an email address" }


	class LinkHelper
		include  ActionView::Helpers::UrlHelper
	end	

	def initialize(args = {})
		super(args)
		#email = args[:email]
		email_hash = ::BCrypt::Password.create("#{email}", :cost => Invitation::COST).to_s if email
		#raise email.inspect
	end	

# 	INVITE_MESSAGE = <<-MESSAGE
# Hi! You are invited for registration to the conference at our site! 
# Your link is #{INVITE_MESSAGE_TOKEN}
# Enjoy!
# 	MESSAGE

	def self.generate_link(email, email_hash)
		LinkHelper.new.link_to('Click here to create profile', 
			"http://localhost:3000"+Rails.application.routes.url_helpers.new_speaker_path(hash: email_hash))
	end	
	def self.invite_speaker(email, email_hash, message)
        # if params[:message].match(INVITE_MESSAGE_REGEXP)
		# insert link Speaker.generate_link(email), email, hash into invirations
	    message = message.gsub!(Message::TOKEN_REGEXP, Invitation.generate_link(email, email_hash))
	    InviteMailer.speaker_invite(email, message).deliver 
	end	


end
