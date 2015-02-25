class Location < ActiveRecord::Base
	geocoded_by :full_address
	after_validation :geocode

	validates :address, presence: true
	validates :city, presence: true
	
	def full_address
    	"#{address}, #{city}"
  	end

	belongs_to :conference

	has_and_belongs_to_many :contacts


end
