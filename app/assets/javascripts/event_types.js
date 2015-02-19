  function imageFromField(){
      obj = document.getElementById('event_type_image');
      if(obj.innerHTML){
          imageToField(obj.innerHTML);
      }
      else{
          imageToField('0');
      }
  }

  function imageToField(number) {
    document.getElementById('event_type_image').innerHTML = number;
    document.getElementById('event_type_image').value = number;

    classString = "btn btn-default btn-sm glyphicon glyphicon-";
    classString += GLYPHSJS[number];
    document.getElementById('DropDownMark').className = classString;
      
      spanObj = document.getElementsByClassName('ddHead');
      spanObj = spanObj[0].getElementsByTagName('ul');
      spanObj = spanObj[0].getElementsByTagName('li');
      for (var i = spanObj.length - 1; i >= 0; i--) {
          spanObj[i].style.border = "1px solid transparent";
      };
      spanObj[number].style.border = "1px solid #563d7c";
  }


function getDefaultDuration(){
  selected_event_type =  event_event_type_id.value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        var duration = JSON.parse( xmlhttp.responseText );
        event_hours.value = duration.hour;
        event_mins.value = duration.min;
        event_hours.onchange();
        event_mins.onchange();
    }
  }
  xmlhttp.open("GET", "/admin/event_types/get_default_duration?id=" + selected_event_type, true);
  xmlhttp.send();
}