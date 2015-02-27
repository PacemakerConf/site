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
					$('#flag-' + years[i]).children('img').attr('src', '/assets/GREYdark.png');
				}
				else{
					$('.conference-' + years[i]).fadeToggle();
					$('#flag-' + years[i]).children('img').attr('src', '/assets/REDlight.png');
				}	
// 	$('.flag-year-image-container').hover(function(){
//     $(this).hover('.flag-year-image-container').children('img').animate({ boxShadow : "0 0 5px 3px rgba(100,100,200,0.4)" });
//     }, function(){
//     $('.flag-year-image-container').children('img');
// }); 
		// .css('background-image','url(background.png)');
}
});
};
};