$(function(){
	$('.feature_game_search input').keyup(function (){
		$("#search_wrapper").html("<img src='/assets/spinner.gif'/>")
		delay(function(){
			$.get($('.feature_game_search').attr('action'), $(".feature_game_search").serialize(), null, 'script');
		}, 1000 );
		return false;
	});
	$("#search_wrapper").on("click", '.game_search_pagination .pagination a', function() {
		$(".pagination").html("<image src='/assets/spinner.gif'/>");
    $.getScript(this.href);
    return false;
  });
});
$("#toggle").click(function (event){
	$("#featured_games_list").slideFadeToggle();
	if ($(this).text() == "collapse ↑") {
		$(this).text("show ↓").html();
	} else {
		$(this).text("collapse ↑").html();
	}
	event.preventDefault();
});
$.fn.slideFadeToggle = function(speed, easing, callback) {
  return this.animate({opacity: 'toggle', height: 'toggle'}, speed, easing, callback);
};