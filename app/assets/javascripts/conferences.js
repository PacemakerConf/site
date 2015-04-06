$(document).on('ready page:load', conferencePageLoad);

function conferencePageLoad() {
    if ($('.conference_data_table')) {
        $('.conference_data_table').dataTable({
            paging: true,
            dom: 'Rlfrtip',
            "order": [
                [1, "desc"],
                [2, 'asc']
            ],
            "aoColumnDefs": [{
                "bSortable": false,
                "aTargets": [-1, -2]
            }]
        });
    }
}