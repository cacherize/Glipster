$('#title_search').keyup(function (){
	$("#results").html("<img src='/assets/spinner.gif' id='search_loading'/>")
	delay(function(){
		$.get($('#search').attr('action'), $("#search").serialize(), null, 'script');
	}, 1000 );
	return false;
});
$("#results").on("click", '.pagination a', function() {
	$(".pagination").html("<image src='/assets/spinner.gif'/>");
  $.getScript(this.href);
  return false;
});