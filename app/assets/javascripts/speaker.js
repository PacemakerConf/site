window.onload = function(){
	console.log('windiw onload');
}

$(document).ready(function(){
	console.log('document ready');
});

$(document).on('page:before-change', function(){
	console.log('page:before-change');
});

$(document).on('page:fetch', function(){
	console.log('page:fetch');
});

$(document).on('page:receive', function(){
	console.log('page:receive');
});

$(document).on('page:before-unload', function(){
	console.log('page:before-unload');
});

$(document).on('page:change', function(){
	console.log('page:change');
});

$(document).on('page:update', function(){
	console.log('page:update');
});

$(document).on('page:load', function(){
	console.log('page:load');
});