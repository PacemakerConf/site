class Speaker < ActiveRecord::Base

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
	validates :email, email_format: { message: "doesn't look like an email address" }
	validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def fullname
		[name, surname].join ' '
	end

end
