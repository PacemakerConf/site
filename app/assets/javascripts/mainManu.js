$(document).ready(setFlagColors);
$(document).on('page:load', setFlagColors);

function setFlagColors(){
	
	if( typeof conference_menu != 'undefined'){
		
		$('.flag-year-image-container').click(function(){
			// $('#' + this.id.toString()).children('img').attr('src', '/assets/RED.png');
			var years = conference_menu.getAttribute('years');
			years = years.split(', ');			
			years = years.slice(1, years.length-1);
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