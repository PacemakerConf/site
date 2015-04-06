module ConferencesHelper

	def scheduleColor(color)
		go = color.to_s
		tr = 0
		cl = []
		endString = ""
		for i in 1..3
			cl[i] = (go[i*2 - 1].to_s + go[i*2].to_s).to_i(16);
		end

		if (cl[1] < 40) && (cl[2] < 40) && (cl[3] < 40)
			endString = "#FFFFFF"
		elsif  (cl[1] < 200) && (cl[2] < 200) && (cl[3] < 200)
			endString = go + "; color: #FFFFFF"
		else
			endString = go
		end			

		return endString
	end

	def get_active_button
		buttons_order = ['show', 'speakers', 'schedule', 'location', 'report']
		index = buttons_order.index(params[:action])
		buttons_class = ['','','','','']
		buttons_class[index] = 'active'
		buttons_class
	end

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

	def admin_schedule( groupable, eventsSingle, eventsGroupable)
		@@schedule = '<ul id="sortable" class="list-group" style="margin-bottom: 5px;">'
		@@positionNumber = 0
  		@@trigger = true
  		eventsSingle.each do |event|
    		if groupable then
      			if (event.position > eventsGroupable[0].position) && @@trigger then
		        	@@schedule += admin_schedule_groupable_part eventsGroupable
		        	@@trigger = false
		        end
		    end
			@@schedule += '<li class="ui-state-default list-group-item schedule-item" '
			if !event.published
				@@schedule += 'style="background-color: #FFA"'
			end
			@@schedule += '><span class="timestart" style="position: relative;"></span> '
			@@schedule += '<span class="duration" style="position: relative;">'
			@@schedule += conferenceEventDurationReturn(event.duration) + '</span> | '
			@@schedule += '<span style="position: relative;">' + event.title + '</span>'
			@@schedule += '<span class="idItems" style= "display: none;">'
			@@schedule += event.id.to_s + '</span>'
			@@schedule += '<span class="positionItems" style="display: none;">'
			@@schedule += @@positionNumber.to_s + '</span>'
			@@positionNumber += 1
			@@schedule += '<span class="groupableItems" style="display: none;" >0</span>'
			@@schedule += '<span style="position:relative;" style="font-weight:normal;">'
			if event.speaker.nil? then
			   @@schedule += ' >' + event.responsable
			else
			   @@schedule += ' -' + link_to(event.speaker.name + " " + event.speaker.surname, event.speaker, :style => 'font-weight: bold;')
			end
			@@schedule += '</span></li>'
	  	end
		@@schedule += '</ul>'
		return @@schedule
	end

	def admin_schedule_groupable_part (eventsGroupable)
		@@groupSum = 0
		@@accessId = ""
		eventsGroupable.each do |item|
			@@accessId += item.id.to_s + ","
			@@groupSum += 1
		end
		@@groupPart = ""
		@@groupPart += '<li class="ui-state-default list-group-item schedule-item" >'
        @@groupPart += '<span class="timestart" style="position: relative;"></span>'
        @@groupPart += '<span class="duration" style="position: relative;"> '
        @@groupPart += conferenceEventGroupDurationReturn(eventsGroupable) + '</span> | '
        @@groupPart += '<span style="position: relative;">'
        @@groupPart += eventsGroupable[0].title + '</span>'
        @@groupPart += '<span class="idItems" style= "display: none;">' + @@accessId + '</span>'
        @@groupPart += '<span class="positionItems" style="display: none;">'
        @@groupPart += @@positionNumber.to_s + '</span>'
        @@positionNumber += 1
        @@groupPart += '<span class="groupableItems" style="display: none;" >'
        @@groupPart += @@groupSum.to_s + '</span>'
        eventsGroupable.each do |eventGroup|
    	    if !(eventGroup.speaker_id.nil?)
    	        @@groupPart += '<span style="position:relative;"> -'
    	        @@groupPart += link_to(eventGroup.speaker.name + " " + eventGroup.speaker.surname, eventGroup.speaker, :style => 'font-weight: bold;')
     	        @@groupPart += '/</span>'
    	    end
  	    end
    	@@groupPart += '</li>'
    	return @@groupPart
	end
end