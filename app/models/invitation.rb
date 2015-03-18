class Invitation < ActiveRecord::Base
	COST = 10
	belongs_to :message

	validates :email, presence: true,
		email_format: { message: "doesn't look like an email address" }
	# validates_associated :message

	delegate :content, to: :message, prefix: true
	
	class LinkHelper
		include  ActionView::Helpers::UrlHelper
	end	

	def initialize(args = {})
		super(args)
		self.email_hash = ::BCrypt::Password.create("#{email}", :cost => Invitation::COST).to_s if email
	end	

	def self.generate_link(email, email_hash)
		LinkHelper.new.link_to('Click here to create profile', 
			"http://localhost:3000"+Rails.application.routes.url_helpers.new_speaker_path(hash: email_hash))
	end

	def self.invite_speaker(email, email_hash, message)
  	  message = message.gsub!(Message::TOKEN_REGEXP, Invitation.generate_link(email, email_hash))
	    InviteMailer.speaker_invite(email, message).deliver 
	end	

end
