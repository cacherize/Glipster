$(document).ready(function(){
  $("#featured_image_link").autocomplete({
    source: $("#featured_image_link").data('autocomplete'),
  });
});