class Year < ActiveRecord::Base
	LAST_YEAR = 5000

	has_many :conferences

	validates :name, presence: true, 
	   				 uniqueness: true,
	   				 inclusion: 2012..Year::LAST_YEAR
end
