class Location < ActiveRecord::Base

	validates :address, presence: true
	validates :city, presence: true
	validates :name, presence: true
	validates :place_type, presence: true
	
  default_scope { order(id: :asc) }
	
	def full_address
    	"#{city}, #{address}".truncate(20)
  	end

	belongs_to :conference
	has_and_belongs_to_many :contacts

end
