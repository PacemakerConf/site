$(document).on('page:change', eventFormLoad);

function addMailRow(){
    var divHTML = 
    '<div class="form-group ">'+
     '<label class="col-lg-2 control-label label_contact">Email</label>'+
      '<div class="col-lg-7 contact_form">'+
        '<input class="form-control mail-adreess" type="text" >'+
      '</div>'+
      '<a class="remove_nested_fields btn-default btn-sm btn-danger" id="remove_button_contact" onclick="RemoveMail(this);return false;">-</a>'+
    '</div>';
    $("#mail-area").append(divHTML);

  
  } 

  function RemoveMail(button){
    $(button).parent().remove();
  }


  function checkIsValid(){
    var mails = '';
    var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
    var isPassed = true;
      $('.mail-adreess').each(function(index,obj){
        if($(obj).val() != '' && $(obj).val().search(emailRegEx) != -1)
          mails+=$(obj).val()+';';
        else
          isPassed = false;
      });

      if(isPassed)
        $('[name="contact[email]"]').val(mails);
      else
        $('.mail-adreess').parent().addClass('has-error');
      return isPassed;
  }