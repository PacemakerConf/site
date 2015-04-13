class Configuration < ActiveRecord::Base
	before_create :clean_configurations

	def self.apply_date_validation?
		Configuration.create! if Configuration.count === 0
		self.first.apply_date_validation
	end

	private

		def clean_configurations
			Configuration.delete_all
		end

end