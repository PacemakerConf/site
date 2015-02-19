function setEventHoursDuration(){
	var newHour = parseInt( event_hours.value );
	var durationDate = new Date( event_duration.value );
	durationDate.setUTCHours( newHour );
	event_duration.value = durationDate;
	console.log(event_duration.value);
}

function setEventMinsDuration(){
	var newMin = parseInt( event_mins.value );
	var durationDate = new Date( event_duration.value );
	durationDate.setMinutes( newMin );
	event_duration.value = durationDate;
	console.log(event_duration.value);
}
