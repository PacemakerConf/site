$(document).on('ready page:load', function () { 
	scheduleChange();                    
    $( "#sortable" ).sortable({
		update: function( event, ui ) { scheduleChange(); sendAJAX(); }
	});             
});
function scheduleChange(){
	$schedule = $('.schedule');
	startDate = moment($schedule.data('start-time'), 'YYYY-MM-DD HH:mm:ss Z')._d;
	break_time = 0; // in seconds
	timeFormat = 'HH:mm';
	$.each($schedule.find('.schedule-item'), function(i, eventElement) {
		$eventElement = $(eventElement);
		$timestart = $eventElement.find('.timestart')
		$timestart.html('<span class="glyphicon glyphicon-time" style="position: relative;"></span>');
		$timestart.append(moment(startDate).format(timeFormat));
		eventDuration = $eventElement.data('event-duration');
		startDate.setSeconds(startDate.getSeconds() + eventDuration + break_time);
	})
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