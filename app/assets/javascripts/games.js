$(document).ready(function(){
	if ($("#game_show").length > 0) {
		game_show();
	}
});

function game_show() {
	var width = $("#game_show").width();
	$("#game_stats, #game_details").width(width);
}