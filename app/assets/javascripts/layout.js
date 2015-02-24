$(document).ready(conferencePageLoad);
$(document).on('page:load', conferencePageLoad);

function conferencePageLoad(){
	if( typeof conference_nav_buttons != 'undefined'){
		active_button = conference_nav_buttons.getAttribute('active') + '_button';
		$('#' + active_button).addClass('active');
	}
}