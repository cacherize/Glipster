$(document).ready(function() {
  $("#support_ticket_other_reason").click(function() {
    if ($("#support_ticket_reason_other").not(":checked")) {
      $("#support_ticket_reason_other").prop("checked", true);
    }
  });
  $("[name='support_ticket[reason]']").change(function(){
    $("#support_ticket_other_reason").val('');
  });

  $('#support_ticket_message').keyup(function () {
    var max = 1000;
    var len = $(this).val().length;
    if (len >= max) {
      $('#messageCharCount').text('No characters left');
    } else {
      var char = max - len;
      $('#messageCharCount').text(char + ' characters left');
    }
  });
});