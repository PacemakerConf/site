$(document).ready(conferencePageLoad);
$(document).on('page:load', conferencePageLoad);

function conferencePageLoad(){
	
	if( typeof conference_nav_buttons != 'undefined'){
		active_button = conference_nav_buttons.getAttribute('active') + '_button';
		$('#' + active_button).addClass('active');
	}
	
	if( typeof conference_menu != 'undefined'){
		$('.flag-year-image-container').click(function(){
			// $('#' + this.id.toString()).children('img').attr('src', '/assets/RED.png');
			var years = conference_menu.getAttribute('years');
			years = years.slice(1, years.length-1);
			years = years.split(', ');
			var year = this.getAttribute('year');

			for(var i = 0; i < years.length; i++){
				if(years[i] != year){
					$('.conference-' + years[i]).hide();
					$('#flag-' + years[i]).children('img').attr('src', '/assets/GREY.png');
				}
				else{
					$('.conference-' + years[i]).toggle();
					$('#flag-' + years[i]).children('img').attr('src', '/assets/RED.png');
				}	
			}
		});
	}

}
