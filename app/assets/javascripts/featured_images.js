$(document).ready(function(){
  $("#featured_image_link").autocomplete({
    source: $("#featured_image_link").data('autocomplete'),
  });
  $("#featured_image_list").sortable({
    update: function(e, index) {
      update_list_index(index)
    }
  });
  $("#featured_image_list").disableSelection();
});

function update_list_index(index) {
  $(".featured_image").each(function(index){
    $(this).children(".image_position").text(index+1);
    $(this).children("input[type=hidden]").val(index);
  });
}