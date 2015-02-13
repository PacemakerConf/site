module Admin::ApplicationHelper

	def conferenceTimeReturn (duration)
		stringTime = ""
		if (duration.hour.to_i > 0) then
			stringTime += duration.hour.to_s + 'hr '
		end

		if (duration.min.to_i >10) then
			stringTime += duration.min.to_s + 'min'
		else
			stringTime += '0' + duration.min.to_s + 'min'
		end

		return stringTime
	end

end
