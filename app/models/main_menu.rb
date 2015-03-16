class MainMenu

	def self.params
		conferences = Conference.all.order(date: :asc)
		years = Year.all.order(name: :asc)
		last_year = years[-1]
		
		return conferences, years, last_year
	end

end
