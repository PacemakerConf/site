$(document).on('ready page:load', pageLoad);

function pageLoad(){
	//datatable
	(function(){
		if( $('.data_table') ){
			$('.data_table').dataTable({
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
			format: 'YYYY/MM/DD hh:mm',
			stepping: 15
		});
		$('.datetimepicker_deadline').datetimepicker({
			format: 'YYYY/MM/DD'
		});

	//EMAIL
  $('.mail_button').click(function(){
  	console.log('click');
    var mails = '';
    var emailRegEx = /^\w+@\w+\.[a-z]+$/i;
    var isCorrect = true;
      $('#mail-address').each(function(index, obj){
        if($(obj).val() != '' && $(obj).val().search(emailRegEx) != -1){
           $(obj).parent().removeClass('has-error')
        }
        else {
          isCorrect = false;
          $(obj).parent().addClass('has-error')
          $("#error-area").html('');
          $("#error-area").append(ERROR_DIV);
        }
        
      });
      // if(isCorrect)
      //   $('[name="contact[email]"]').val(mails);
      //   return isCorrect;
    });

	}
}