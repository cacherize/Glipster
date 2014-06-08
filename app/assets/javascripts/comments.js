$(document).ready(function(){
  $(".comment_message").dotdotdot({
    ellipsis : '',
    after: "a.read_more"
  });

  $(".game_comment_list").on("click", ".read_more", function() {
    var parent = $(this).parent(".comment_message"),
        content = parent.triggerHandler("originalContent");
    parent.removeClass('collapsed');
    $(parent).append( content );
    parent.trigger("destroy");
    parent.append("<br/><a class='hide'>Hide</a>")
  });
  
  $(".game_comment_list").on("click", ".hide", function(){
    var parent = $(this).parent(".comment_message");
    $("br:last", parent).remove();
    $(this).remove();
    parent.addClass('collapsed');
    parent.dotdotdot({
      ellipsis : '',
      after: "a.read_more"
    });
  });
});