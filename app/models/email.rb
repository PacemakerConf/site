class Email < ActiveRecord::Base
	belongs_to :contact
	validates :email, :email => true
end
