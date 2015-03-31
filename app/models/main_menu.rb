class MainMenu

	def self.params
		years = Year.all.order(name: :asc)
		conferences = Conference.all.order(date: :asc)
		last_year = years[-1]
		
		return conferences, years, last_year
	end

end
