$("#file_submit").on('click', function(){
  if ($("#game_uploader_game").val() == "") {
    alert("You must select a file first.");
    return false;
  }
});
$("#game_uploader_game").change(function(){
  var size = this.files[0].size,
      MBsize = (size / (1024*1024)).toFixed(2),
      value = $(this).val();

  if (value !== "") {
    $("#fileName span").text(value);

    if (MBsize > 50) {
      $("#val_file_size").show();
      disable("#file_submit");
    } else {
      $("#val_file_size").hide();
      undisable("#file_submit");
    }

    var ext = value.split('.').pop().toLowerCase();
    if($.inArray(ext, ['swf']) == -1) {
      $("#val_file_type").show();
      disable("#file_submit");
    } else {
      $("#val_file_type").hide();
      undisable("#file_submit");
    }
  } else {
     $("#fileName span").html('<i>No file selected</i>')
  }
});

function disable(element) {
  $(element).attr("disabled","disabled");
}
function undisable(element) {
  $(element).removeAttr('disabled')
}

function openFileBrowser() {
  $("#game_uploader_game").click();
  return false;
}