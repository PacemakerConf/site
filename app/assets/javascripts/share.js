$(document).on('ready page:load', pageLoad);

function pageLoad(){

	//datatable
		(function(){
		if( $('.data_table') ){
			$('.data_table').dataTable({
       	paging: true,
				dom: 'Rlfrtip',
				"order": [[ 2, "desc" ]],
				"aoColumnDefs": [{ "bSortable": false, "aTargets": [-1, -2] }]
	    });
  	}
	})();

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

	// fileinput
	if($('.file_input')){
		$(".file_input").fileinput({
	    maxFilesNum: 1
	  });
	}
	
  // wysiwyg
	if($('#editor')){
    $('#editor').wysiwyg();
 
    var innerwysiwyg = $('.wysiwyg_textarea').val();
    $('#editor').append(innerwysiwyg);
    
    $('[name="commit"]').click(function(){
      info = $('#editor').html();
      $('.wysiwyg_textarea').val(info);
    });
	}

	// data picker
	if($('.datetimepicker')){
		$('.datetimepicker').datetimepicker({
			stepping: 15
		});
		$('.datetimepicker_deadline').datetimepicker({
			// minDate: 01/01/2010
			// maxDate: 31/12/2050
		});
	}
}