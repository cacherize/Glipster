$(document).ready(function(){
	if ($("#game_show").length > 0) {
		game_show();
	}

  $("#game_stats").on('click', '#stats_toggle, #hide', function(event){
    if ($("#stats_toggle").text() == "More Info") {
      $("#stats_toggle").html("<a id='stats_toggle'><img src='/assets/toggle_up.png'/><p>Hide Info</p></a>");
      $("#ext_stats").slideFadeToggle();
      $(".play_count").textFit({alignHoriz:true, maxFontSize: 55});
    } else {
      $("#stats_toggle").html("<a id='stats_toggle'><img src='/assets/toggle_down.png'/><p>More Info</p></a>");
      $("#ext_stats").slideFadeToggle();
    }
    return false;
  });
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
