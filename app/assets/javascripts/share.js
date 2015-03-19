$(document).on('page:change', pageLoad);

function pageLoad(){

	(function(){
		if( !$('#dataTableLoaded')[0] ){
			$('.data_table').dataTable({
	      paging: true
	    });

	    $('body').append("<div id='dataTableLoaded'></div>");
  	}
	})();

	(function(){
		$(".file_input").fileinput({
      maxFilesNum: 1
    });
	})();

	if($('#editor')){
	    $('#editor').wysiwyg();
	 
	    var innerwysiwyg = $('.wysiwyg_textarea').val();
	    $('#editor').append(innerwysiwyg);
	    
	    $('[name="commit"]').click(function(){
	      info = $('#editor').html();
	      $('.wysiwyg_textarea').val(info);
	    });

	}

}

