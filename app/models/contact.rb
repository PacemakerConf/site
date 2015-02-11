class Contact < ActiveRecord::Base
	belongs_to :location

	validates :name, presence: true
	validates :surname, presence: true
	validates :location_id, presence: true
end
