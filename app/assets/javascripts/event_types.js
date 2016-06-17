function imageToField(number) {
  $('#event_type_image').html(number).val(number);


  classString = "btn btn-default btn-sm glyphicon glyphicon-";
  classString += GLYPHSJS[number];
  obj = $('#DropDownMark');
  document.getElementById('DropDownMark').className = classString;

  spanObj = $('.ddHead');
  spanObj = spanObj[0].getElementsByTagName('ul');
  spanObj = spanObj[0].getElementsByTagName('li');

  for (var i = spanObj.length - 1; i >= 0; i--) {
    spanObj[i].className = 'non-selected';
  };
  spanObj[number].className = 'selected';
}


function setDefaultData(){
  selected_event_type = $('#event_event_type_id').val();
  $.ajax({
    url: "/admin/event_types/" + selected_event_type + ".json",
    success: function(response){
      if(response.durationHour < 10){
        response.durationHour = '0' + response.durationHour 
      }
      if(response.durationMin < 10){
        response.durationMin = '0' + response.durationMin 
      }
      speakerEvent = response.speakerEvent.toString() === 'true';
      $('#event_title').val(response.defaultName);     
      $('#event_duration_4i').val(response.durationHour);
      $('#event_duration_5i').val(response.durationMin);
      
      toggleEventFields( speakerEvent );
    }
  })
}

$(document).on('ready page:load', eventTypePageLoad);

function eventTypePageLoad() {
    if ($('.event_type_data_table')) {
        $('.event_type_data_table').dataTable({
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
