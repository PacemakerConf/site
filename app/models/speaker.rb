class Speaker < ActiveRecord::Base
	class LinkHelper
		include  ActionView::Helpers::UrlHelper
	end	
	INVITE_MESSAGE_TOKEN = '$${link_invitation}' 
	INVITE_MESSAGE_REGEXP = /\$\$\{\w+\}/
	INVITE_MESSAGE = <<-MESSAGE
Hi! You are invited for registration at our site! 
Your link is #{INVITE_MESSAGE_TOKEN}
Enjoy!
	MESSAGE

	has_many :events
	has_many :conferences, through: :events

	has_attached_file :photo, styles: {
		thumb: '150x150>',
		medium: '300x300>'
	}

	validates :name, presence: true
	validates :surname, presence: true
	validates :position, presence: true
	validates :description, presence: true
	validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def fullname
		[name, surname].join ' '
	end

	def self.generate_link(email)
		cost = 10
		hash = ::BCrypt::Password.create("#{email}", :cost => cost).to_s
		LinkHelper.new.link_to('Create Your Profile', 
			"http://localhost:3000/admin"+Rails.application.routes.url_helpers.new_speaker_path(hash: hash))
	end	
	def self.invite_speaker(email, message)
        # if params[:message].match(INVITE_MESSAGE_REGEXP)
		# insert link Speaker.generate_link(email), email, hash into invirations
	    message = message.gsub!(INVITE_MESSAGE_REGEXP, Speaker.generate_link(email))
	    InviteMailer.speaker_invite(email, message).deliver_later
	end	
end
