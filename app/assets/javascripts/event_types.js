function imageFromField(){
    obj = $('#event_type_image');
    if(obj.html()){
        imageToField(obj.html());
    }
    else{
        imageToField('0');
    }
}

function imageToField(number) {
  $('#event_type_image').html(number);
  $('#event_type_image').val(number);

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
  selected_event_type =  event_event_type_id.value;
  if ($('input[name=_method]').val() !== 'patch' ) {
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
        debugger;
        if(!speakerEvent){
          event_title.value = response.defaultName;
        }
        event_duration_4i.value = response.durationHour;
        event_duration_5i.value = response.durationMin;

        toggleEventFields( speakerEvent );
      }
    })
  }
}
