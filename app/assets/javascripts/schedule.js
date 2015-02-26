// console.log('schedule.js');
$(document).ready(function(){scheduleChange(); $('#sortable').click(function(){ scheduleChange(); }); });

function scheduleChange(){
	console.log('ScheduleTime()');
	
	timestartItems = $('.timestart');
	durationItems = $('.duration');

	if ( timestartItems.length === durationItems.length) {
		var currentTime = [9,0];
		var pause = 5;

		for (var i = 0; i < timestartItems.length; i++) {
			var stringTime = "";
			if(currentTime[0] < 10){
				stringTime = '0';
			}
			stringTime += currentTime[0] + ':';
			if(currentTime[1] < 10){
				stringTime += '0';
			}
			stringTime += currentTime[1];
			timestartItems[i].innerHTML = stringTime;

			tempTime = parseTime(durationItems[i]);
			currentTime[0] += tempTime[0];
			currentTime[1] += tempTime[1] + pause;
			if(currentTime[1]>=60){
				var overHours = parseInt(currentTime[1]/60);
				currentTime[0] += overHours;
				currentTime[1] -= overHours*60;
			}
		};
	}
	else{
		console.log("some gone wrong: timestartItems.length != durationItems.length");
	};

}

function parseTime(durationItem){
	durationArray = durationItem.innerHTML.split(":");
	durationArray[0] = parseInt(durationArray[0]);
	durationArray[1] = parseInt(durationArray[1]);
	return durationArray;
}

function sendAJAX(){
    console.log('AJAX?');

    some_var = $('.okay');
    some_var = some_var[0].value;

    xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	    	var response =  JSON.parse( xmlhttp.responseText );
	    	console.log( response.position );
	    	response.position = some_var;
	    	console.log(response.position);
	    }
	  
	}
	
	xmlhttp.open("PATCH", "/admin/events/" + 1 + "/position.html", true);
	xmlhttp.send();


 //  selected_event_type =  event_event_type_id.value;
 //  xmlhttp = new XMLHttpRequest();
 //  xmlhttp.onreadystatechange = function() {
 //    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
 //        var response = JSON.parse( xmlhttp.responseText );
 //        event_hours.value = response.durationHour;
 //        event_mins.value = response.durationMin;
 //        event_hours.onchange();
 //        event_mins.onchange();
        
 //        toggleSpeakerDropdown(response.speakerEvent);
 //    }
 //  }
 //  xmlhttp.open("GET", "/admin/event_types/" + selected_event_type + ".json", true);
 //  xmlhttp.send();

 }