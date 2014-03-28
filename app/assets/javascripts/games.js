$(document).ready(function(){
	if ($("#game_show").length > 0) {
		game_show();
	}
});

function game_show() {
	var width = $("#game_show").width();
	$("#game_stats, #game_details, #comments_wrapper").width(width);
}

$(function(){
	$("#comments_wrapper").on('click', '.pagination a', function(){
		$(".pagination").html("<image src='/assets/spinner.gif'/>");
		$.getScript(this.href)
		return false;
		// game_show();
	});
	// For older jQuery versions...
	// jQuery.ajaxSetup({ 
	//   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
	// });
});
