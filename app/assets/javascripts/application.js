// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.dialog
//= require jquery.ui.autocomplete
//= require jquery.ui.sortable
//= require jquery.placeholder
//= require jquery.dotdotdot.min
//= require jquery.purr
//= require best_in_place
$(document).ready(function(){
	$('input, textarea').placeholder();

	$('li.submenu_container').hover(function () {
  	if ($('> div.submenu',this).length > 0) {
  	    $('> div.submenu',this).stop().slideDown('fast');
  	}
	},function () {
		if ($('> div.submenu',this).length > 0) {
			$('> div.submenu',this).stop().slideUp('fast');
		}
	});
	$(".game_link").dotdotdot({});
	$(".vertical_game_link p").dotdotdot({});
	$(".search_result_description").dotdotdot({});
  $(".item_description").dotdotdot({});
});

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$.fn.slideFadeToggle = function(speed, easing, callback) {
  return this.animate({opacity: 'toggle', height: 'toggle'}, speed, easing, callback);
};

jQuery.fn.random = function() {
    var randomIndex = Math.floor(Math.random() * this.length);  
    return jQuery(this[randomIndex]);
};