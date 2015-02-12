class Speaker < ActiveRecord::Base
	has_many :events
	has_many :conferences, through: :events

	has_attached_file :photo, styles: {
		thumb: '150x150>',
		medium: '300x300>'
	}

	validates :name, presence: true

	validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def fullname
		self.name.to_s + ' ' + self.surname.to_s
	end
end
