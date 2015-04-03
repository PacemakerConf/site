class Invitation < ActiveRecord::Base
	COST = 10
	belongs_to :message
	belongs_to :conference
	validates :conference_id, presence: true 
	validates :message_id, presence: true 
	validates :email, presence: true,
		email_format: { message: "doesn't look like an email address" }

	attr_accessor :host	

	delegate :content, to: :message, prefix: true
	
	class LinkHelper
		include  ActionView::Helpers::UrlHelper
	end	

	def initialize(args = {})
		super(args)
		self.email_hash = ::BCrypt::Password.create("#{email}", :cost => Invitation::COST).to_s if email
		@host = args[:host] 
	end	

	def generate_link
	  if speaker = Speaker.where(email: email)[0]
	  	LinkHelper.new.link_to('Click here to create profile', 
	  	"http://" + @host + Rails.application.routes.url_helpers.edit_speaker_path(speaker, hash: email_hash))
	  else
	  	LinkHelper.new.link_to('Click here to create profile', 
	  	"http://" + @host + Rails.application.routes.url_helpers.new_speaker_path(hash: email_hash))
	  end
	end

	def invite_speaker
  	  message = message_content.gsub!(Message::TOKEN_REGEXP, generate_link)
	    InviteMailer.speaker_invite(email, message).deliver
	end	
end
