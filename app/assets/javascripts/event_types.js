window.onload = function() {
    // alert('0');
	imageFromField('0');
    // alert('1');
}

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

	classString = "btn btn-default btn-sm glyphicon glyphicon";
    GLYPHS = ["-list","-fire","-leaf","-music","-user","-asterisk","-plus","-minus","-cloud","-envelope","-pencil","-glass","-search","-heart","-star","-star-empty","-th","-th-large","-th-list","-ok","-remove","-cog","-trash","-home","-file","-time","-road","-download","-download-alt","-upload","-inbox","-repeat","-refresh","-lock","-qrcode","-barcode","-tag","-tags","-bookmark","-picture","-map-marker","-move","-play","-stop","-plus-sign","-minus-sign","-remove-sign","-ok-sign","-question-sign","-info-sign","-remove-circle","-ok-circle","-ban-circle","-gift","-eye-open","-calendar","-random","-comment","-magnet","-hdd","-bell","-bullhorn"]
    classString += GLYPHS[number];
	document.getElementById('DropDownMark').className = classString;
    
    spanObj = document.getElementsByClassName('ddHead');
    spanObj = spanObj[0].getElementsByTagName('ul');
    spanObj = spanObj[0].getElementsByTagName('li');
    for (var i = spanObj.length - 1; i >= 0; i--) {
        spanObj[i].style.border = "1px solid transparent";
    };
    spanObj[number].style.border = "1px solid #563d7c";
}