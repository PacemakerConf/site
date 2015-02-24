module Admin::ApplicationHelper

	def conferenceEventDurationReturn (duration)
		stringTime = ""
		if (duration.hour.to_i > 0) then
			stringTime += duration.hour.to_s + ':'
		else
			stringTime += '0:'
		end

		if (duration.min.to_i >10) then
			stringTime += duration.min.to_s
		else
			stringTime += '0' + duration.min.to_s
		end

		return stringTime
	end

end
