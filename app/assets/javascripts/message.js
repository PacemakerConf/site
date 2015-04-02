$(document).on('ready page:load', messagePageLoad);

function messagePageLoad(){
	if( $('.message_data_table') ){
		$('.message_data_table').dataTable({
     	paging: true,
			dom: 'Rlfrtip',
			"order": [[ 0, "desc" ]],
			"aoColumnDefs": [{ "bSortable": false, "aTargets": [-1, -2] }]
    });
	}
}