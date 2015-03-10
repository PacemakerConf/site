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

	def conferenceEventGroupDurationReturn ( events )
		duration = 0;

		events.each do |event|
			if can? :read, event
				duration += event.duration.hour.to_i * 60 + event.duration.min.to_i
			end
		end

		stringTime = ""
		hours = duration / 60;
		minutes = duration % 60;
		if ( hours > 0) then
			stringTime += hours.to_s + ':'
		else
			stringTime += '0:'
		end

		if ( minutes >10) then
			stringTime += minutes.to_s
		else
			stringTime += '0' + minutes.to_s
		end

		return stringTime
	end

end
