class Contact < ActiveRecord::Base

	def full_name
  		surname.to_s + " " + name.to_s
	end

	def splited_mail
		email.split(';')
	end

	def splited_telephone
		telephone.split(';')
	end

	has_and_belongs_to_many :locations

	validates :name, presence: true
	validates :surname, presence: true
	validates :telephone, presence: true
	validates :email, presence: true
	
end
