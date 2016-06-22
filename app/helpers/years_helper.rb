module YearsHelper
	def get_years_list
	  years_options = ''
    current_year = @year.name || Time.now.year 
    Year::FIRST_YEAR.upto(current_year.to_i+9) do |year| 
      if current_year.to_s === year.to_s 
        selected = " selected='selected'" 
      else 
        selected = '' 
      end 
      years_options += " <option value=" + year.to_s + selected + 
      	" > " + year.to_s + "</option> "
    end
    years_options 
	end
end
