$(document).on('ready page:load', function() {
    pageLoad();
    handleAjaxSpeackerForm();
});

function pageLoad() {
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
    if ($('#editor')) {
        $('#editor').wysiwyg();

        var innerwysiwyg = $('.wysiwyg_textarea').val();
        $('#editor').append(innerwysiwyg);

        $('[name="commit"]').click(function() {
            info = $('#editor').html();
            $('.wysiwyg_textarea').val(info);
        });
    }

    // data picker
    if ($('.datetimepicker')) {
        $('.datetimepicker').datetimepicker({
            format: 'YYYY/MM/DD HH:mm',
            stepping: 15
        });
        $('.datetimepicker_deadline').datetimepicker({
            format: 'YYYY/MM/DD'
        });
    };

    $( "#but" ).click(function() {
      $( "#save" ).show();
      $( "#but" ).hide();
      $( "#wisywyg_container" ).hide();
      var htmlString = $( "#editor" ).html();
      $( "#editor" ).text( htmlString );
    });

    $( "#savecode" ).click(function() {
      $( "#but" ).show();
      $( "#save" ).hide();
      $( "#wisywyg_container" ).show();
      var htmlString = $( "#editor" ).text();
      $( "#editor" ).html( htmlString );
    });

    $("#nostyle").click(function(){
      $("#editor").html($("#editor").text());
    });
}

function handleAjaxSpeackerForm() {
    $('#myModal form').on('ajax:success', function(e, data, status, xhr) {
        $successElement = $('#success-sent');
        $successElement.html('<h4>Great! Your email has been sent!</h4>').removeClass().addClass('alert alert-dismissible alert-success');
        this.reset();
    }).on('ajax:error', function(e, xhr, status, error) {
        $successElement = $('#success-sent');
        $successElement.html('<h4>Error! Something went wrong, please try again or contac to the administrator</h4>').removeClass().addClass('alert alert-dismissible alert-warning');
    }).on('ajax:complete', function() {
        setTimeout(function() {
            $successElement = $('#success-sent');
            $successElement.html('').removeClass();
        }, 8000);
    })
}