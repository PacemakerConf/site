class Configuration < ActiveRecord::Base
	attr_accessor :admin_email

	before_create :clean_configurations
	before_save :set_admin_email

	DEFAULT_ADMIN_EMAIL = 'admin@example.com'

	def self.apply_date_validation?
		Configuration.new({admin_email: DEFAULT_ADMIN_EMAIL}).create! if Configuration.count === 0
		self.first.apply_date_validation
	end

	def self.get_conf
		conf = first || new
		conf.admin_email = Admin.first.email
		conf
	end	

	private

		def clean_configurations
			Configuration.delete_all
		end

		def set_admin_email
			admin = Admin.first
			if self.admin_email && admin.email != self.admin_email
				admin.email = self.admin_email
				admin.save!
			end	
		end

end