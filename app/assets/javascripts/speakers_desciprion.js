$(document).on("page:change", function(){

$('#editor').wysiwyg();
 
    $('[name="commit"]').click(function(){
      info = $('#editor').html();
      $('[name="speaker[description]"]').val(info);
    });
});