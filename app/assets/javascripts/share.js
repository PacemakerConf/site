$(document).on('page:change', pageLoad);

function pageLoad(){
	if( !$('#dataTableLoaded')[0] ){
		$('.data_table').dataTable({
      paging: true
    });

    $('body').append("<div id='dataTableLoaded'></div>")
  }

}

