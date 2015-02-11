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
