function setEventHoursDuration(){
	var newHour = parseInt( event_hours.value );
	var durationDate = new Date( event_duration.value );
	durationDate.setUTCHours( newHour );
	event_duration.value = durationDate;
	// console.log(event_duration.value);
}

function setEventMinsDuration(){
	var newMin = parseInt( event_mins.value );
	var durationDate = new Date( event_duration.value );
	durationDate.setMinutes( newMin );
	event_duration.value = durationDate;
	console.log(event_duration.value);

}

function toggleSpeakerDropdown(speakerEvent){
	if ( parseInt(speakerEvent) === 0 ){
		event_speaker_id.disabled = true;
		event_speaker_id.value = "";
	}
	else if( parseInt(speakerEvent) === 1 ){
		event_speaker_id.disabled = '';
	}
}
