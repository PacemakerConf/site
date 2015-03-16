class Year < ActiveRecord::Base
	has_many :conferences

	validates :name, presence: true, 
					 uniqueness: true
end
