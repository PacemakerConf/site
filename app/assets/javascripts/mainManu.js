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
					$('.conference-' + years[i]).fadeToggle();
					$('#flag-' + years[i]).children('img').attr('src', '/assets/RED.png');
				}	

// $('.flag-year-image-container').hover(function() {
// $(this).hover('.flag-year-image-container').toggleClass( "hoverClass", 20 ), function(){
// $('.flag-year-image-container').children('img').toggleClass( "nohoverClass", 20 )};
// }); 
		
		// .css('background-image','url(background.png)');
		// .css('box-shadow', '2px 2px 2px #555');
		// .css({ boxShadow: '1px 3px 6px #444' })
		// .toggleClass( "newClass", 200 ), function(){
  //   $('.flag-year-image-container').children('img').css('box-shadow', '2px 2px 2px #555');
}
});
};
};