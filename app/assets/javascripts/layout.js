$(document).ready(flagsLoad);
$(document).on('page:load', flagsLoad);

function flagsLoad(){
	if( typeof conference_menu != 'undefined'){
		var years = conference_menu.getAttribute('years');
		years = years.slice(1, years.length-1);
		years = years.split(', ');

		// for(var i = 0; i < years.length; i++){
			// var flagStyleCss = '.flag-' + years[i];
			// console.log(flagStyleCss);

			$(".flag-2014").click(function(){
				
				$('.conference-2014').toggle();
			});
		// }
	}
}