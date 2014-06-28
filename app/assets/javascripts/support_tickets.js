$(document).ready(function() {

  $("#support_ticket_other_reason").click(function() {
    if ($("#support_ticket_reason_other").not(":checked")) {
      $("#support_ticket_reason_other").prop("checked", true);
    }
  });
  $("[name='support_ticket[reason]']").change(function(){
    $("#support_ticket_other_reason").val('');
  });

  if ($("#contact_us_form").length > 0){countMessageCharacters("#support_ticket_message")}

  $('#support_ticket_message').keyup(function () {
    countMessageCharacters(this);
  });

  if ($(".reason_filter").length > 0) {
    $(".reason_filter").each(function(){
      markEnabledReasonFilters(this)
    });
  }

  $(".reason_filter").change(function(){
    markEnabledReasonFilters(this)
  });
});

function markEnabledReasonFilters(field) {
  if ($(field).is(":checked")) {
    $(field).parent(".reason_filter_wrapper").addClass('filterEnabled');
  } else {
    $(field).parent(".reason_filter_wrapper").removeClass('filterEnabled');
  }
}

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