$(document).on("page:change", function(){

  $('[name="commit"]').click(function(){
    var mails = '';
    var emailRegEx = /^\w+@\w+\.[a-z]+$/i;
    var isCorrect = true;
      $('.mail-adreess').each(function(index, obj){
        if($(obj).val() != '' && $(obj).val().search(emailRegEx) != -1){
          mails+=$(obj).val()+';';
           $(obj).parent().removeClass('has-error')
        }
        else {
          isCorrect = false;
          $(obj).parent().addClass('has-error')

          $("#error-area").html('');
          $("#error-area").append(divError);
        }
        
      });
      if(isCorrect)
        $('[name="contact[email]"]').val(mails);

      return isCorrect;
    });
});

var divError =
'<div class="alert alert-dismissible alert-danger">'+
      '<button type="button" class="close" data-dismiss="alert">×</button>'+
      '<strong>Oh snap!</strong>'+
      '<ul>'+
          '<li>Email can\'t be blank</li>'+
      '</ul>'+
'</div>'