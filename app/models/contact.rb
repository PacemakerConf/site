class Contact < ActiveRecord::Base
	has_and_belongs_to_many :location

	validates :name, presence: true
	validates :surname, presence: true
	validates :location_id, presence: true
end
