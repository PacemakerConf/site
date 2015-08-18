class MainMenu

	def self.params
		return conferences, years, last_year
	end

  def self.years
    Year.all.order(name: :asc)
  end

  def self.last_year
    years.last
  end

  def self.conferences
    Conference.all.by_date_asc
  end

end
