$(document).on("page:change", function(){

  $("#add_button").click(function() {
    $("#mail-area").append(INPUT_DIV);
  });

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
          $("#error-area").append(ERROR_DIV);
        }
        
      });
      if(isCorrect)
        $('[name="contact[email]"]').val(mails);
        return isCorrect;
    });

});

var INPUT_DIV = 
  '<div class="form-group ">'+
    '<label class="col-lg-2 control-label label_contact">Email</label>'+
    '<div class="col-lg-7 contact_form">'+
      '<input class="form-control mail-adreess" type="text" >'+
    '</div>'+
    '<a class="remove_nested_fields btn-default btn-sm btn-danger" id="remove_button_contact" onclick="RemoveMail(this);return false;">-</a>'+
  '</div>';

var ERROR_DIV =
  '<div class="alert alert-dismissible alert-danger">'+
    '<button type="button" class="close" data-dismiss="alert">×</button>'+
    '<strong>Oh snap!</strong>'+
    '<ul>'+
      '<li>Email invalid or can\'t be blank</li>'+
    '</ul>'+
  '</div>';
