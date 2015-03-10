$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);

function pageLoad(){

    $('.data_table').dataTable({
      paging: true
    });

}

