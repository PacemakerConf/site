// site preloader
var preloaderPageLoaded = function(){
	$('#preloader').fadeOut('slow',function(){$(this).hide();});
	handleAnchorClick();
}
window.stopPreloader = preloaderPageLoaded;

var preloaderShow = function(){
	$('#preloader').fadeIn();
}

var handleAnchorClick = function(){
	$("a[href*='" + location.host + "'], a:not([href^='//'])[href^='/']").on('click', preloaderShow);
}

jQuery(document).ready(function($) {
	$(document).on('ready page:load', preloaderPageLoaded);
	$(window).load(preloaderPageLoaded);
	handleAnchorClick();
});