class Conference < ActiveRecord::Base
	has_many :events
	has_many :speakers, through: :events

	validates :name, presence: true

end
