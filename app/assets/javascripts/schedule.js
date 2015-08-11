$(document).on('ready page:load', function () { 
	scheduleChange();                    
    $( "#sortable" ).sortable({
		update: function( event, ui ) { scheduleChange(); sendAJAX(); }
	});             
});
function scheduleChange(){
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
			timestartItems[i].innerHTML = '<span class="glyphicon glyphicon-time" style="position: relative;"></span> ' + stringTime;

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
		console.log("something went wrong: timestartItems.length != durationItems.length");
	};
}
function parseTime(durationItem){
	durationArray = durationItem.innerHTML.split(":");
	durationArray[0] = parseInt(durationArray[0]);
	durationArray[1] = parseInt(durationArray[1]);
	return durationArray;
}
function sendAJAX(){
	$('#AjaxButton').addClass('hidden');
	$('.alert').removeClass('alert-info alert-success alert-danger');
	$('.alert').addClass('alert-warning');
	$('.alert').html('Status: Working');
    idItems = $('.idItems');
    positionItems = $('.positionItems');
    groupableItems = $('.groupableItems');
	var queryLine = "/admin/events/position.json";
	var idString = "";
	var posString = "";
	for (var i = 0; i < idItems.length; i++){
		if ( positionItems[i].innerHTML != i ) {
			if(groupableItems[i].innerHTML > 0 ){
				idString += idItems[i].innerHTML;
				for (var j = 0; j < groupableItems[i].innerHTML; j++) {
					posString += i + ',';
				};
			}
			else{
				idString += idItems[i].innerHTML + ',';
				posString += i + ',';
			}
			
		};
	}
	queryLine += "?position=" + posString + "&id=" + idString;
	// console.log(queryLine);
	$.getJSON( queryLine, function( response ) {
		$('.alert').removeClass('alert-warning');
	    if( response.status === 'Done' ){		
   			$('.alert').addClass('alert-success');
   			$('.alert').html('Status: Current schedule saved on the server.')
   			for (var i = 0; i < idItems.length; i++){
				positionItems[i].innerHTML = i;
			}
        }
        else{
   			$('#AjaxButton').removeClass('hidden');
   			$('.alert').addClass('alert-danger');
   			var statusFail = 'Schedule has not been saved on server. Please try again later. If the error persists, contact your administrator.' + response.status;
   			$('.alert').html(statusFail + '<button onclick="sendAJAX()" class="btn btn-warning" style="position: relative;float:right;">Try Again</button>');
        }
        $('#AjaxButton').html(response.status);
	}).fail(function( jqxhr, textStatus, error ){  
			$('#AjaxButton').removeClass('hidden');
	        $('.alert').removeClass('alert-warning');
	        $('.alert').addClass('alert-danger');
	        var statusFail = "Problems with internet connection or server. Schedule has not been saved on server. Please try again later. If the error persists, contact your administrator. Error:" + error;
	        $('.alert').html(statusFail + '<button onclick="sendAJAX()" class="btn btn-warning" style="position: relative;float:right;">Try Again</button>');
    });
 }	