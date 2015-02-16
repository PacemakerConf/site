class Contact < ActiveRecord::Base
	belongs_to :location

	validates :name, presence: true
	validates :surname, presence: true
end
