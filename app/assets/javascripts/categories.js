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
  $(".game_count_graphic").textFit({alignHoriz:true, maxFontSize: 35});
  rotateSlideshow()
}

function rotateSlideshow(){
  var interval = (Math.ceil(Math.random() * 2) + 1) * 1000,
      target = $(".games_container").random(),
      targetWrapper = target.find(".game_wrapper:visible"),
      lastDivId = target.find(".game_wrapper:last").attr("id");

  setTimeout(function() {
    targetWrapper.fadeOut(function(){
      if (this.id == lastDivId) {
        $(this).parent().children(".game_wrapper:first").fadeIn()
      } else {
        $(this).next().fadeIn();
      }
    });
    rotateSlideshow()
  }, interval);
}