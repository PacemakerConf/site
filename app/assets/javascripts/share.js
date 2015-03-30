$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);

function pageLoad(){

	//datatable
		(function(){
		if( $('.data_table') ){
			$('.data_table').dataTable({
       	paging: true,
				dom: 'Rlfrtip',
				"order": [[ 0, "desc" ]]
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
			// minDate: 01/01/2010
			// maxDate: 31/12/2050
		});
	}
}


