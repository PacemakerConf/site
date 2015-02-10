jQuery(document).on('ready page:change', function() {
    var datetimefield = jQuery('.datetimepicker');
    datetimefield.datetimepicker({
        format: 'Y-m-d H:i:s',
        lang: datetimefield.attr('lang') || datetimefield.parents('[lang]').attr('lang')
	    minDate:'2010/01/01',
	    maxDate:'2100/01/01',
	    minTime:'08:00',
	    maxTime:'12:01',
	    step:15,
    });
});
