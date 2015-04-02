$(document).on('ready page:load', setFlagColors);

function setFlagColors(){
	if( typeof conference_menu != 'undefined'){
		active_conference = $('#conference_menu').attr('active_conference')
		active_conference = active_conference.replace(/&/g, '\\&');
		active_conference = active_conference.replace(/ /g, '\\ ');
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
		$('#flag-'+ active_year).children('img').attr('src', '/assets/redflag.png');

		if (active_year === last_year){
			$('#' + active_conference + '-' + active_year).children().children('img').attr('src', '/assets/greenflag.png');
		}
		else {
			$('#' + active_conference + '-' + active_year).children().children('img').attr('src', '/assets/blueflag.png');
		};

		// Add style to all flag on hover
		for(var i = 0; i < years.length; i++){
			$('.conference-' + years[i]).hover(function(){
				$(this).find('img').addClass('blue-flag');
			},function(){
		    $(this).find('img').removeClass('blue-flag');
		  });
		}

	  // Add style to last year flag on hover
	  $('.conference' + '-' + last_year).hover(function(){
			$(this).find('img').addClass('green-flag');
		},function(){
	    $(this).find('img').removeClass('green-flag');
	  });

		// Add style to year flag on hover
		$('.flag-year-image-container').hover(function(){
	    $(this).addClass('hovered').find('img').addClass('red-flag');
		},function(){
			$(this).removeClass('hovered').find('img').removeClass('red-flag');
		});

		// Add style to conference flag on hover
		$('.flag-image-container').hover(function(){
	    $(this).addClass('hovered');
		},function(){
		    $(this).removeClass('hovered');
		});
		
		// Make a wide flag if long conference name
		$('.flag-image-container').filter( function(){ 
			return $(this).text().length>42;
			 } ).find('img').animate({
			 	width: "70", 
			 	height: "73"
			 }, 0);

		$('.flag-image-container').filter( function(){ 
			return $(this).text().length>45;
			} ).addClass('long-text').find('img').animate({
				width: "106%", 
				height: "73",
			}, 0);

		// Show all conference flags of current year on click and hide other flags
		$('.flag-year-image-container').click(function(){
			console.log('click');
			var year = this.getAttribute('year'); 	
			$('.year-box').addClass('unvisible');
			$('.main-content').addClass('unvisible');
			$('#year-' + year + '-box').removeClass('unvisible');

		for(var i = 0; i < years.length; i++){
			if(years[i] != year){
				$('.conference-' + years[i]).hide();
				$('#flag-' + years[i]).children('img').attr('src', '/assets/greyflag.png');
			}
			else{
				$('.conference-' + years[i]).fadeToggle();
				$('#flag-' + years[i]).children('img').attr('src', '/assets/redflag.png');
			}	
		}
		});
	};
};