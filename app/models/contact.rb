class Contact < ActiveRecord::Base

	def full_name
    	"#{surname} #{name}"
  	end

	has_many :emails, :dependent => :destroy
	accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:email].blank? }


	has_and_belongs_to_many :locations

	validates :name, presence: true
	validates :surname, presence: true
	validates :telephone, presence: true
	validates :email, presence: true
	validates :skype, presence: true
end
