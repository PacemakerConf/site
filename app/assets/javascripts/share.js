$(document).on('ready page:load', pageLoad);

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
            format: 'YYYY/MM/DD hh:mm',
            stepping: 15
        });
        $('.datetimepicker_deadline').datetimepicker({
            format: 'YYYY/MM/DD'
        });
    };
    //email validator
    $('.mail_button').on('click', function(e) {
        e.preventDefault();
        var form = $('#myModal').find('form');
        var email = $('#mail-address').val();
        var emailRegEx = /^[\w\d\.\-]+@\w+\.[a-z]+$/i;
        if (email.match(emailRegEx)) {
            form.submit()
            $('#success-sent').html('<h4>Great! Your email has been sent!</h4>').removeClass().addClass('alert alert-dismissible alert-success');
        } else {
            $('#success-sent').html('<h4>Warning! Enter correct value!</h4>').addClass('alert alert-dismissible alert-warning');
        }
    });
}