class MainMenu

	def self.params
		conferences = Conference.all.order(date: :asc)
		years = conferences.uniq.pluck(:year).sort
		last_year = years[-1]

		return conferences, years, last_year
	end

end
