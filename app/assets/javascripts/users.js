$(document).ready(function(){
  $("#change_av_link").click(function(){
    $("#change_prof_pic").dialog({
      modal: true,
      height: 350,
      width: 400,
      resizable: false
    });
    return false;
  });
  $("#user_image").change(function(){
    validateFileType(this)
  });
});

function openFileBrowser() {
  $("#user_image").click();
  return false;
}

function validateFileType(input) {
  var val = $(input).val(),
      ext = val.split('.').pop().toLowerCase(),
      img = $("#user_show .profile_pic img").attr('src');
  
  if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
    alert('Please select an image file (gif, png, jpg, or jpeg)');
    $("#user_image").val('');
    $("#pending_filename").text('');
    $("#userImgPrev").attr('src', img)
  } else {
    imgPrev(input);
    $("#pending_filename").text('File: '+val);
  }
}

function imgPrev(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $('#userImgPrev').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}