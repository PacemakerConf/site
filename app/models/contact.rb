class Contact < ActiveRecord::Base

	def full_name
    	"#{surname} #{name}"
  	end

  	def splited_mail
  		email.split(';')
  	end

	has_and_belongs_to_many :locations

	validates :name, presence: true
	validates :surname, presence: true
	validates :telephone, presence: true
	validates :email, presence: true
	validates :skype, presence: true
	
end
