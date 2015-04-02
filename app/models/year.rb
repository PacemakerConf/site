class Year < ActiveRecord::Base
	LAST_YEAR = 5000

	has_many :conferences

	validates :name, presence: true, 
	   				 uniqueness: true,
	   				 inclusion: "2010"..Year::LAST_YEAR.to_s

  default_scope { order(id: :asc) }
  
end
