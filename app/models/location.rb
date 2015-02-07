class Location < ActiveRecord::Base
	geocoded_by :full_address
	after_validation :geocode

	def full_address
    	"#{address}, #{city}"
  	end

	belongs_to :conference

	has_and_belongs_to_many :contacts

	validates :address, presence: true
	validates :conference_id, presence: true
end
