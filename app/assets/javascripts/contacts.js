$(document).on("ready page:load", function(){
  //Adding new field
  $("#add_button").click(function() {
    $("#mail-area").append(INPUT_DIV);
  });
  //Email validation function
  $('[name="commit"]').click(function(){
    var mails = '';
    var emailRegEx = /^\w+@\w+\.[a-z]+$/i;
    var isCorrect = true;
      $('.mail-address').each(function(index, obj){
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
  //Checking last symbol of mails variable
  if($(".allmails").val()){
    var savedMails = $(".allmails").val();
    var lastSymbol = savedMails.charAt(savedMails.length-1);
    if(lastSymbol == ";"){
      savedMails = savedMails.substring(0, savedMails.length-1);
    }
    //Pasring inro array
    var mailsArray = savedMails.split(";");
    //Appending fields with their values
    if(mailsArray){
      $.each(mailsArray,function(index, obj){
        $("#mail-area").append(INPUT_DIV);
        $(".mail-address:eq("+index+")").val(mailsArray[index]);
      });
      $(".mail-address:last").parents(':eq(1)').remove();
    }
  }
});
//Function for deleting div with text field and button
function RemoveMail(button){
  $(button).parent().remove();
}
//CONSTANTS
var INPUT_DIV = 
  '<div class="form-group ">'+
    '<label class="col-lg-2 control-label label_contact">Email</label>'+
    '<div class="col-lg-7 contact_form">'+
      '<input class="form-control mail-address" type="text" >'+
    '</div>'+
    '<a class="remove_nested_fields btn-default btn-sm btn-danger" id="remove_button_contact" onclick="RemoveMail(this)">-</a>'+
  '</div>';

var ERROR_DIV =
  '<div class="alert alert-dismissible alert-danger">'+
    '<button type="button" class="close" data-dismiss="alert">×</button>'+
    '<strong>Oh snap!</strong>'+
    '<ul>'+
      '<li>Email invalid or can\'t be blank</li>'+
    '</ul>'+
  '</div>';
