// $(document).on('page:load', setFlagColors);
$(document).on('page:change', setFlagColors);
// $(document).ready(setFlagColors);
function setFlagColors(){
	
	if( typeof conference_menu != 'undefined'){

		active_conference = $('#conference_menu').attr('active_conference')
		active_year = $('#conference_menu').attr('active_year')
		last_year = $('#conference_menu').attr('last_year')

		var years = conference_menu.getAttribute('years');

		years = years.split(', ');			
		years = years.slice(1, years.length-1);
		years.unshift((years[0]-1).toString());

		for(var i = 0; i < years.length; i++){
			if(years[i] != active_year){
				$('.conference-' + years[i]).hide();
			}
		}	
	
		$('#flag-'+ last_year).hide();
		$('#flag-'+ active_year).children('img').attr('src', '/assets/RED.png');

		$('#' + active_conference + '-' + active_year).children().children('img').attr('src', '/assets/BLUE.png');
	
		$('.flag-year-image-container').click(function(){
			console.log('click');	
			var year = this.getAttribute('year'); 	
			for(var i = 0; i < years.length; i++){
				if(years[i] != year){
					$('.conference-' + years[i]).hide();
					$('#flag-' + years[i]).children('img').attr('src', '/assets/GREY.png');
				}
				else{
				console.log(years[i]);
					$('.conference-' + years[i]).fadeToggle();
					$('#flag-' + years[i]).children('img').attr('src', '/assets/RED.png');
				}	
			}
		});
	};
};

// $('.flag-year-image-container').hover(function() {
// $(this).hover('.flag-year-image-container').toggleClass( "hoverClass", 20 ), function(){
// $('.flag-year-image-container').children('img').toggleClass( "nohoverClass", 20 )};
// }); 
		// .css('background-image','url(background.png)');
		// .css('box-shadow', '2px 2px 2px #555');
		// .css({ boxShadow: '1px 3px 6px #444' })
		// .toggleClass( "newClass", 200 ), function(){
  //   $('.flag-year-image-container').children('img').css('box-shadow', '2px 2px 2px #555');