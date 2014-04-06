$(function(){
	$('.feature_game_search input').keyup(function (){
		$("#search_wrapper").html("<img src='/assets/spinner.gif'/>")
		delay(function(){
			$.get($('.feature_game_search').attr('action'), $(".feature_game_search").serialize(), null, 'script');
		}, 1000 );
		return false;
	})
});