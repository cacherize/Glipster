$('#search').keyup(function (){
  $("#category_game_search_results").html("<img src='/assets/spinner.gif' id='search_loading'/>")
  delay(function(){
    $.get($('#category_search').attr('action'), $("#category_search").serialize(), null, 'script');
  }, 1000 );
  return false;
});

$("#search").on("click", '.pagination a', function() {
  $(".pagination").html("<image src='/assets/spinner.gif'/>");
  $.getScript(this.href);
  return false;
});
$("#search").placeholder();

$(document).ready(function(){
  if ($("#all_categories").length > 0) {
    categoriesIndex()
  }
});

function categoriesIndex() {
  $(".games_container").each(function(){
    $(this).find(".game_wrapper").hide().first().show();
  })
  rotateSlideshow()
}

function rotateSlideshow(){
  var interval = (Math.ceil(Math.random() * 3) + 1) * 1000;
  var target = $(".games_container").random().find(".game_wrapper:visible");
  setTimeout(function() {
    target.fadeOut(function(){
      if ($(this).is(":last-child")) {
        $(this).parent().children(".game_wrapper:first-child").fadeIn()
      } else {
        $(this).next().fadeIn();
      }
    });
    rotateSlideshow()
  }, interval);
}