class Location < ActiveRecord::Base

	validates :address, presence: true
	validates :city, presence: true
	validates :name, presence: true
	validates :place_type, presence: true
	
	def truncated_address
    	(city.to_s + ", " + address.to_s).truncate(20)
  	end

	belongs_to :conference
	has_and_belongs_to_many :contacts

end
