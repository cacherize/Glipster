$(document).ready(function(){
  var cookies_enabled = are_cookies_enabled();
  if (!cookies_enabled) {
    $("#sign_up_message").remove();
    $(".form").remove();
    $("#cookies_disabled").show();
  }
});

function are_cookies_enabled()
{
    var cookieEnabled = (navigator.cookieEnabled) ? true : false;

    if (typeof navigator.cookieEnabled == "undefined" && !cookieEnabled)
    { 
        document.cookie="testcookie";
        cookieEnabled = (document.cookie.indexOf("testcookie") != -1) ? true : false;
    }
    return (cookieEnabled);
}