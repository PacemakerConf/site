class MainMenu

	def self.params
		years = Year.all.order(name: :asc).includes(:conferences)
		last_year = years[-1]
		
		return years, last_year
	end

end
