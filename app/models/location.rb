class Location < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode

	belongs_to :conference

	has_many :contacts

	validates :address, presence: true
	validates :conference_id, presence: true
end
