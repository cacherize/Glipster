$(document).ready(function(){
  $("#change_av_link").click(function(){
    $("#change_prof_pic").dialog({
      modal: true,
      height: 250,
      width: 400,
      resizable: false
    });
    return false;
  });
  $("#user_image").change(function(){
    var val = $(this).val();
    $("#pending_file").text(val);
  });
});