$(document).on('ready page:load', function() {
    pageLoad();
    handleAjaxSpeackerForm();
});

function pageLoad() {
  var but = $( "#but" );
  var save = $( "#save" );
  var editor = $( "#editor" );
  var wisywyg_container = $( "#wisywyg_container" );

  //datatable
  (function() {
      if ($('.data_table')) {
          $('.data_table').dataTable({
              paging: true,
              dom: 'Rlfrtip',
              "order": [
                  [0, "desc"]
              ],
              "aoColumnDefs": [{
                  "bSortable": false,
                  "aTargets": [-1, -2]
              }]
          });
      }
  })();

  // fileinput
  if ($('.file_input')) {
      $(".file_input").fileinput({
          maxFilesNum: 1
      });
  }

  // wysiwyg
  if (editor) {
      editor.wysiwyg();

      var innerwysiwyg = $('.wysiwyg_textarea').val();
      editor.append(innerwysiwyg);

      $('[name="commit"]').click(function() {
          info = editor.html();
          $('.wysiwyg_textarea').val(info);
      });
  }

  // data picker
  but.click(function() {
    save.show();
    but.hide();
    wisywyg_container.hide();
    editor.text( editor.html() );
  });

  $( "#savecode" ).click(function() {
    but.show();
    save.hide();
    wisywyg_container.show();
    editor.html( editor.text() );
  });

  $("#nostyle").click(function(){
    editor.html(editor.text());
  });

  $(function () {
    $('#datetimepicker').datetimepicker({
      format: 'YYYY/MM/DD HH:mm',
      stepping: 15
    });
    $('#datetimepicker_deadline').datetimepicker({
      format: 'YYYY/MM/DD'
    });
  });
}

function handleAjaxSpeackerForm() {
    $('#myModal form').on('ajax:success', function(e, data, status, xhr) {
        $successElement = $('#success-sent');
        this.reset();
    });
    $('#myModal form').on('ajax:complete', function() {
        setTimeout(function() {
            $successElement = $('#success-sent');
            $successElement.html('<h4>Great! Your email has been sent!</h4>').removeClass().addClass('alert alert-dismissible alert-success');
            }, 8000);
        $('.data_input').val('');
    })
}

