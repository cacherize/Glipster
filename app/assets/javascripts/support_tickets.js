$(document).ready(function() {
  $("#support_ticket_other_reason").click(function() {
    if ($("#support_ticket_reason_other").not(":checked")) {
      $("#support_ticket_reason_other").prop("checked", true);
    }
  });
  $("[name='support_ticket[reason]']").change(function(){
    $("#support_ticket_other_reason").val('');
  })
});
