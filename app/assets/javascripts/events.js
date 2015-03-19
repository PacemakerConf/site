$(document).on('page:change', eventFormLoad);

function toggleEventFields(speakerEvent){
	console.log('----');
	console.log(speakerEvent);
	if( speakerEvent ){
		$('#event_speaker_id_group').show();
		$('#event_materials_group').show();
		$('#event_responsable_group').hide();
		event_responsable.value = '';
	}	
	else {
		$('#event_speaker_id_group').hide();
		event_speaker_id.value = "";
		$('#event_materials_group').hide();
		event_materials.value = "";
		$('#event_responsable_group').show();
	}
}

function eventFormLoad(){
	if(typeof event_event_type_id != 'undefined' && $('.admin_event_form').length ){
		var speakerEvent = event_event_type_id.getAttribute("speakerEvent");
		toggleEventFields(speakerEvent.toString() === 'true'); 		
		getDefaultDuration();
	}
}