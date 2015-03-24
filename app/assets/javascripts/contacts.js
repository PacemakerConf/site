$(document).on("page:change", function(){

  $("#add_button").click(function() {
     var divHTML = 
      '<div class="form-group ">'+
       '<label class="col-lg-2 control-label label_contact">Email</label>'+
        '<div class="col-lg-7 contact_form">'+
          '<input class="form-control mail-adreess" type="text" >'+
        '</div>'+
        '<a class="remove_nested_fields btn-default btn-sm btn-danger" id="remove_button_contact" onclick="RemoveMail(this);return false;">-</a>'+
      '</div>';
      $("#mail-area").append(divHTML);
  });

  $('[name="commit"]').click(function(){
    var mails = '';
    var emailRegEx = /^\w+@\w+\.[a-z]+$/i;
    var isCorrect = true;
      $('.mail-adreess').each(function(index, obj){
        if($(obj).val() != '' && $(obj).val().search(emailRegEx) != -1)
          mails+=$(obj).val()+';';
        else 
          isCorrect = false;
      });
      if(isCorrect)
        $('[name="contact[email]"]').val(mails);
      else
        $('.mail-adreess').parent().addClass('has-error');
      return isCorrect;
    });
});

