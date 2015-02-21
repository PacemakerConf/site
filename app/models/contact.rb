class Contact < ActiveRecord::Base
	
	has_many :telephones, :dependent => :destroy
	accepts_nested_attributes_for :telephones, :reject_if => lambda { |a| a[:number].blank? }


	belongs_to :location

	validates :name, presence: true
	validates :surname, presence: true
end
