$('#title_search').keyup(function (){
	$("#results").html("<img src='/assets/spinner.gif'/>")
	delay(function(){
		$.get($('#search').attr('action'), $("#search").serialize(), null, 'script');
	}, 1000 );
	return false;
});