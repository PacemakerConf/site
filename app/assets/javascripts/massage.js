$(document).on('ready page:load', messagePageLoad);

function messagePageLoad(){
	if( $('.massage_data_table') ){
		$('.massage_data_table').dataTable({
     	paging: true,
			dom: 'Rlfrtip',
			"order": [[ 0, "desc" ]],
			"aoColumnDefs": [{ "bSortable": false, "aTargets": [-1, -2] }]
    });
	}
}