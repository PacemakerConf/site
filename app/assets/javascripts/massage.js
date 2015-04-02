$(document).on('ready page:load', pageLoad);

function pageLoad(){

	//datatable_massage
		(function(){
		if( $('.data_table_massage') ){
			$('.data_table_massage').dataTable({
       	paging: true,
				dom: 'Rlfrtip',
				"order": [[ 0, "desc" ]],
				"aoColumnDefs": [{ "bSortable": false, "aTargets": [-1, -2] }]
	    });
  	}
	})();
}