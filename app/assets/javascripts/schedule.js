// console.log('schedule.js');
// $(document).ready(function(){scheduleChange()});


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
		console.log("some shit: timestartItems.length != durationItems.length");
	};

}

function parseTime(durationItem){
	durationArray = durationItem.innerHTML.split(":");
	durationArray[0] = parseInt(durationArray[0]);
	durationArray[1] = parseInt(durationArray[1]);
	return durationArray;
}