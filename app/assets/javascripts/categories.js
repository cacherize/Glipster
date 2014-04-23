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
}