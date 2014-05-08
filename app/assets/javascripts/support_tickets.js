$(document).ready(function() {
  $("#support_ticket_other_reason").click(function() {
    if ($("#support_ticket_reason_other").not(":checked")) {
      $("#support_ticket_reason_other").prop("checked", true);
    }
  });
  $("[name='support_ticket[reason]']").change(function(){
    $("#support_ticket_other_reason").val('');
  });
  countMessageCharacters("#support_ticket_message")
  $('#support_ticket_message').keyup(function () {
    countMessageCharacters(this);
  });
});

function countMessageCharacters(input){
  var max = 1000;
  var len = $(input).val().length;
  if (len >= max) {
    $('#messageCharCount').text('No characters left');
  } else if(len == 0) {
    $('#messageCharCount').text('1000 characters max')
  } else {
    var char = max - len;
    $('#messageCharCount').text(char + ' characters left');
  }
}