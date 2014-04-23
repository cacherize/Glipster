$(document).ready(function(){
	if ($("#game_show").length > 0) {
		game_show();
	}

  if ($("#most_played").length > 0) {
    most_played_games();
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

  $("#comment_message").keyup(function(){
    var max = 255;
    var len = $(this).val().length;
    if (len >= max) {
      $('#char_count').text(' No characters left');
    } else {
      var char = max - len;
      $('#char_count').text(char + ' characters left');
    }
  }); 

  $("#comments_container").on("click", ".read_more", function() {
    var parent = $(this).parent(".comment_message"),
        content = parent.triggerHandler("originalContent");
    parent.removeClass('collapsed');
    $(parent).append( content );
    parent.trigger("destroy");
    parent.append("<br/><a class='hide'>Hide</a>")
  })
  $("#comments_container").on("click", ".hide", function(){
    var parent = $(this).parent(".comment_message");
    $("br:last", parent).remove();
    $(this).remove();
    parent.addClass('collapsed');
    parent.dotdotdot({
      ellipsis : '',
      after: "a.read_more"
    });
  });
}

function most_played_games() {
  var current = window.location.hash.substring(1);
  $(".tab").hide();

  if (current.length > 0) {
    var current_id = "#"+current
    $(current_id).show()
    $(".tab_link a[href="+current_id+"]").addClass("current");
  } else {
    $(".tab").first().show();
    $(".tab_link a").first().addClass('current');
  }

  $(".tab_link").click(function(){
    var id = $("a", this).attr("href");
    $(".tab_link a").removeClass("current");
    $("a", this).addClass("current");
    $(".tab").hide();
    $(id).show();

    return false;
  });
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

function commentOverflow(){
  $(".comment_message").dotdotdot({
    ellipsis : '',
    after: "a.read_more"
  });
}