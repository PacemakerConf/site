$(document).ready(conferencePageLoad);
$(document).on('page:load', conferencePageLoad);

function conferencePageLoad(){
	
	if( typeof conference_nav_buttons != 'undefined'){
		active_button = conference_nav_buttons.getAttribute('active') + '_button';
		$('#' + active_button).addClass('active');
	}
	// if (typeof conference_menu != 'undefined'){
	// 	var pastyear = years(years)
	// };

	if( typeof conference_menu != 'undefined'){
		var years = conference_menu.getAttribute('years');
		years = years.slice(1, years.length-1);
		years = years.split(', ');

		// for(var i = 0; i < years.length; i++){
		// 	var flagStyleCss = '.flag-' + years[i];
		// 	var confStyleCss = '.conference-' + years[i];
		// 	console.log(flagStyleCss);
		// 	console.log(confStyleCss);
			$(".flag-2014").click(function(){
				$('.conference-2014').toggle();
				// $(".flagStyleCss").click(function(){
				// $('.confStyleCss').toggle();
});

// $(document).ready(function () {
// 	$( ".flag-2013" ).click(function() {
// 		$( ".conference-2013" ).first().toggle( 100, function showNext() {
// 			$( this ).next( ".conference-2013" ).toggle( 100, showNext );
// 		});
// 	});
// 	$(".flag-2014").click(function(){
// 		$(this).parent().find( '.conference-2014').first().toggle( 100, function showNext() {
// 			$( this ).next( '.conference-2014').toggle( 100, showNext );
// 		});

// 	});
// 	$( ".flag-2015").click(function() {
// 		$( ".conference-2015" ).first().toggle( 100, function showNext() {
// 			$( this ).next( ".conference-2015" ).toggle( 100, showNext );
// 		});
// 	});
// });

		// }
	}
}