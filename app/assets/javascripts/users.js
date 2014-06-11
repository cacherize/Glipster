$(document).ready(function(){

  $("#likesAll").click(function(){
    $("#likes_list").dialog({
      modal: true,
      width: 500,
      resizable: false
    });
    return false;
  });

  $("#likes_list").on('click', '.pagination a', function(){
    $("#likes_list .pagination").html("<image src='/assets/spinner.gif'/>");
    $.getScript(this.href)
    return false;
  });

  $("#recentsAll, #playsLink").click(function(){
    $("#recently_played_list").dialog({
      modal: true,
      width: 500,
      resizable: false
    });
    return false;
  });

  $("#recently_played_list").on('click', '.pagination a', function(){
    $("#recently_played_list .pagination").html("<image src='/assets/spinner.gif'/>");
    $.getScript(this.href)
    return false;
  });

  $("#change_av_link").click(function(){
    $("#change_prof_pic").dialog({
      modal: true,
      height: 340,
      width: 400,
      resizable: false
    });
    return false;
  });
  
  var current_username = $("#user_username").attr('value');

  $("#change_un_link").click(function(){
    $("#change_username").dialog({
      modal: true,
      height: 250,
      width: 400,
      resizable: false
    });
    $("#user_username").val(current_username);
    $("#username_check").html('&nbsp;')
    return false;
  });

  $("#user_image").change(function(){
    validateFileType(this)
  });

  $("#change_un_link").hover(function(){
    $(this).children("span").stop().animate({width: '100px'})
  }, function(){
    $(this).children("span").stop().animate({width: '0'})
  });

  $(".ext_list_link").hover(function(){
    $(this).children("span").stop().animate({width: '58px'})
  }, function(){
    $(this).children("span").stop().animate({width: '0'})
  });

  var timer;
  $("#user_username").keyup(function(){
    var username = $(this).val();

    delay(function(){
      if (username.search('#') >= 0) {
        $("#username_check").html('<span id="invalid">Username must only contain alphanumeric characters<span class="symbol">&#10007;</span></span>')
        $("#un_submit_btn").attr('disabled', 'disabled');
      } else {
        $.ajax({
          type: "GET",
          url: current_username+"/check_username",
          data: "username=" + username,
          success: function(){
            enabledSubmitIfValid();
          }
        });
      }
    }, 750 );
  });
});

function enabledSubmitIfValid(){
  if ($("#username_check #valid").length > 0) {
    $("#un_submit_btn").removeAttr('disabled');
  } else {
    $("#un_submit_btn").attr('disabled', 'disabled');
  }
}

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
    $("#pending_filename").text('Image Preview');
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