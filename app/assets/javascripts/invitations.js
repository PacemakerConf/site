$(document).on('ready page:load', invitationPageLoad);

function invitationPageLoad(){
	if( $('.invitation_data_table') ){
		$('.invitation_data_table').dataTable({
     	paging: true,
			dom: 'Rlfrtip',
				"order": [[ 2, "desc" ] ]
    });
	}
}
	