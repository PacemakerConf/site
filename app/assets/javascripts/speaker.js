$(document).on("page:change", function(){

        $("#speaker_photo").fileinput({
        maxFilesNum: 1,
        allowedFileExtensions: ["jpg", "gif", "png", "txt"]
        });

		$('#editor').wysiwyg();
		    $('[name="commit"]').click(function(){
		      info = $('#editor').html();
		      $('[name="speaker[description]"]').val(info);
		    });

});
  