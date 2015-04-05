$(document).on('ready page:load', eventFormLoad);

function eventFormLoad(){
	if(typeof event_event_type_id != 'undefined' && $('.admin_event_form').length ){
		var speakerEvent = event_event_type_id.getAttribute("speakerEvent");
		toggleEventFields(speakerEvent.toString() === 'true'); 		
		setDefaultData();
	}

	if($('#speaker_search')[0]){
		$('#speaker_search').keyup(function(){
			$.ajax({
				url: '/admin/speakers/search?input=' + $('#speaker_search').val()
			})
			$('#event_speaker_id').val('');		
		})
	}
}

function toggleEventFields(speakerEvent){
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

function setSpeaker(speaker_id, speaker_fullname){
	$('#event_speaker_id').val(speaker_id);
	$('#speaker_search').val(speaker_fullname );
	$('#speakers-list').html('');
}