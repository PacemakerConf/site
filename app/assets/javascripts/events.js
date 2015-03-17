$(document).on('page:change', eventFormLoad);

function toggleEventFields(speakerEvent){
	if ( parseInt(speakerEvent) === 0 ){
		$('#event_speaker_id_group').hide();
		event_speaker_id.value = "";
	
		$('#event_materials_group').hide();
		event_materials.value = "";
	
		$('#event_responsable_group').show();
	}
	else if( parseInt(speakerEvent) === 1 ){
		$('#event_speaker_id_group').show();
		
		$('#event_materials_group').show();

		$('#event_responsable_group').hide();
		event_responsable.value = '';
	}
}

function eventFormLoad(){
	if( typeof event_event_type_id != 'undefined'){
		var speakerEvent = event_event_type_id.getAttribute("speakerEvent");
	
		toggleEventFields(speakerEvent); 		
		getDefaultDuration();
	}
}