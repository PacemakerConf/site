module ConferencesHelper
  GLYPHS = %w(list fire leaf music user asterisk plus minus cloud envelope pencil glass search heart
    star star-empty th th-large th-list ok remove cog trash home file time road download
    download-alt upload inbox repeat refresh lock qrcode barcode tag tags bookmark picture
    map-marker move play stop plus-sign minus-sign remove-sign ok-sign question-sign info-sign
    remove-circle ok-circle ban-circle gift eye-open calendar random comment magnet hdd bell
    bullhorn)

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

  # TODO fix name of method
  def conferenceEventDurationReturn (duration)
    stringTime = ""
    if (duration.hour.to_i > 0) then
      stringTime += duration.hour.to_s + ':'
    else
      stringTime += '0:'
    end

    if (duration.min.to_i > 10) then
      stringTime += duration.min.to_s
    else
      stringTime += '0' + duration.min.to_s
    end

    return stringTime
  end

  # TODO fix name of method
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

  def admin_schedule(conference, eventsSingle, eventsGroupable)
    groupable = conference.group_event
    scheduleString = "<ul id='sortable' class='list-group schedule' style='margin-bottom: 5px;' data-start-time='#{ conference.date }'>"
    positionNumber = 0
    trigger = true
    eventsSingle.each do |event|
      if groupable && trigger && eventsGroupable[0] && (event.position.to_i > eventsGroupable[0].position.to_i)
        scheduleString += admin_schedule_groupable_part eventsGroupable, positionNumber
        positionNumber += 1
        trigger = false
      end
      scheduleString += "<li data-event-duration='#{ event.duration_in_sec }' class='event ui-state-default list-group-item schedule-item' "

      if !event.published
        scheduleString += 'style="background-color: #FFA"'
      end
      scheduleString += '><span class="timestart" style="position: relative;"></span> '
      scheduleString += '<span class="duration" style="position: relative;">'
      scheduleString += conferenceEventDurationReturn(event.duration) + '</span> | '
      scheduleString += '<span style="position: relative;">' + event.title + '</span>'
      scheduleString += '<span class="idItems" style= "display: none;">'
      scheduleString += event.id.to_s + '</span>'
      scheduleString += '<span class="positionItems" style="display: none;">'
      scheduleString += positionNumber.to_s + '</span>'
      positionNumber += 1
      scheduleString += '<span class="groupableItems" style="display: none;" >0</span>'
      scheduleString += '<span style="position:relative;" style="font-weight:normal;">'
      if event.speaker.nil?
        scheduleString += ' >' + (event.responsable || '')
      else
         scheduleString += ' -' + link_to(event.speaker.name + " " + event.speaker.surname, event.speaker, :style => 'font-weight: bold;')
      end
      scheduleString += '</span></li>'
    end
    scheduleString += admin_schedule_groupable_part(eventsGroupable, positionNumber) if trigger && groupable && eventsGroupable[0]
    scheduleString += '</ul>'
    return scheduleString
  end

  def admin_schedule_groupable_part (eventsGroupable, positionNumber)
    groupSum = 0
    accessId = ""
    total_duration = 0
    eventsGroupable.each do |item|
      total_duration += item.duration_in_sec
      accessId += item.id.to_s + ","
      groupSum += 1
    end
    groupPart = ""
    groupPart += "<li data-event-duration='#{ total_duration }' class='ui-state-default list-group-item schedule-item' >"
    groupPart += '<span class="timestart" style="position: relative;"></span>'
    groupPart += '<span class="duration" style="position: relative;"> '
    groupPart += conferenceEventGroupDurationReturn(eventsGroupable) + '</span> | '
    groupPart += '<span style="position: relative;">'
    groupPart += eventsGroupable[0].title + '</span>'
    groupPart += '<span class="idItems" style= "display: none;">' + accessId + '</span>'
    groupPart += '<span class="positionItems" style="display: none;">'
    groupPart += positionNumber.to_s + '</span>'
    groupPart += '<span class="groupableItems" style="display: none;" >'
    groupPart += groupSum.to_s + '</span>'

    eventsGroupable.each do |eventGroup|
      if !(eventGroup.speaker_id.nil?)
        groupPart += '<span style="position:relative;"> -'
        groupPart += link_to(eventGroup.speaker.name + " " + eventGroup.speaker.surname, eventGroup.speaker, :style => 'font-weight: bold;')
        groupPart += '/</span>'
      end
    end

    groupPart += '</li>'
    return groupPart
  end

  def user_schedule(conference, eventsSingle, eventsGroupable)
    groupable = conference.group_event
    scheduleString = "<table class='table table-responsive table-hover schedule' data-start-time='#{ conference.date }'>"
    scheduleString += '<colgroup><col style = "width: 10%;"></col>'
    scheduleString += '<col></col><col></col></colgroup>'
    scheduleString += '<tbody>'
    trigger = true
    allSingleEvents = eventsSingle.all.to_a.delete_if{|event| !can?(:read, event)}
    eventsGroupable.to_a.delete_if{|event| !can?(:read, event)}
    allSingleEvents.each do |event|
      if groupable && eventsGroupable[0]
        if (event.position.to_i > eventsGroupable[0].position.to_i) && trigger
          accessTrigger = 0
          eventsGroupable.each do |access|
            accessTrigger += 1 if can? :read, access
          end
          if accessTrigger > 0
            scheduleString += user_schedule_groupable_part eventsGroupable
          end
          trigger = false
        end
      end
      scheduleString += '<tr style="background-color:'
      scheduleString += scheduleColor(event.event_type.color)+ ';" class="event schedule-item '
      scheduleString += event.published ? '' : 'unpublished'
      scheduleString += " \" data-event-duration='#{ event.duration_in_sec }' >"
      scheduleString += '<td class="timestart" style="text-align: center; font-size: 1.25em;"></td>'
      scheduleString += '<td class="duration" style="text-align: center; display: none;">'
      scheduleString += conferenceEventDurationReturn(event.duration) + '</td>'
      scheduleString += '<td style="  font-size: 1.25em; "><span class="glyphicon glyphicon-'
      scheduleString += GLYPHS[event.event_type.image.to_i] + '"></span>'
      scheduleString += event.title
      scheduleString += '<span style="position:relative;">'
      if event.speaker.nil?
        scheduleString += ' > ' + '&nbsp;&nbsp;&nbsp;&nbsp;' + "#{event.responsable}" unless event.responsable.empty?
      else
        scheduleString += ' - ' + '&nbsp;&nbsp;&nbsp;&nbsp;' + link_to( event.speaker.name + ' ' + event.speaker.surname, event.speaker, :style => 'font-weight: bold;')
      end
      scheduleString += '</span></td></tr>'
    end
    scheduleString += user_schedule_groupable_part(eventsGroupable) if trigger && groupable && eventsGroupable[0]
    scheduleString += '</tbody></table>'
    return scheduleString
  end

  def user_schedule_groupable_part(eventsGroupable)
    total_duration = eventsGroupable.inject(0){|sum, event| sum += event.duration_in_sec}
    groupPart = "<tr data-event-duration='#{ total_duration }' class='schedule-item' style=\"background-color:"
    groupPart += scheduleColor(eventsGroupable[0].event_type.color)+'">'
    groupPart += '<td class="timestart" style="text-align: center; font-size: 1.25em;"></td>'
    groupPart += '<td class="duration" style="text-align: center; display: none;">'
    groupPart += conferenceEventGroupDurationReturn(eventsGroupable)
    groupPart += '</td>'
    groupPart += '<td style="font-size: 1.25em;">'
    groupPart += '<span class="glyphicon glyphicon-'
    groupPart += GLYPHS[eventsGroupable[0].event_type.image.to_i]
    groupPart += '"></span>'
    groupPart += '<span>'
    groupPart += eventsGroupable[0].title

    eventsGroupable.each do |eventGroup|
      if can? :read, eventGroup
        if !(eventGroup.speaker_id.nil?)
          groupPart += '<span style="position:relative;"> -'
          groupPart += link_to( eventGroup.speaker.name + " " + eventGroup.speaker.surname, eventGroup.speaker, :style => 'font-weight: bold;')
          groupPart += ' /</span>'
        end
      end
    end

    groupPart += '</span>'
    groupPart += '</td>'
    groupPart += '</tr>'
    return groupPart
  end

  # TODO move to wraper
  def publishing_status(object)
    return nil unless object.respond_to? :published
    object.published ? "" : "unpublished"
  end

  def next_conference_for(conference)
    _next_conference = conference.next_conference
    return nil unless _next_conference
    if can? :read, _next_conference
      _next_conference
    else
      next_conference_for(_next_conference)
    end
  end

  def previous_conference_for(conference)
    _previous_conference = conference.previous_conference
    return nil unless _previous_conference
    if can? :read, _previous_conference
      _previous_conference
    else
      previous_conference_for(_previous_conference)
    end
  end

  def nearest_conference
    conf = Conference.nearest
    return unless conf
    if can? :read, conf
      conf
    else
      next_conference_for(conf)
    end
  end

  def nearest_conference_path
    conference_path(nearest_conference)
  end

  def conference_path(conf)
    conf ? about_conference_path(conf.route) : '#'
  end
end
