class Location < ActiveRecord::Base
	geocoded_by :full_address
	after_validation :geocode

	def full_address
    	"#{address}, #{city}"
  	end

	belongs_to :conference

	has_many :contacts

	validates :address, presence: true
end
