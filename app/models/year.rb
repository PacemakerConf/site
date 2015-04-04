class Year < ActiveRecord::Base
	FIRST_YEAR = 2011	
	LAST_YEAR = 5000

	has_many :conferences

	validates :name, presence: true, 
	   							 uniqueness: true,
	   							 inclusion: "2010"..Year::LAST_YEAR.to_s  

	scope :by_name, -> { order(name: :asc) }
end
