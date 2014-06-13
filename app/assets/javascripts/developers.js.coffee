typingTimer = undefined
doneTypingInterval = 750
$("#developer_link").keyup ->
  clearTimeout typingTimer
  typingTimer = setTimeout(doneTyping, doneTypingInterval)  if $("#developer_link").val
  return
doneTyping = ->
  value = $("#developer_link").val()
  value = "http://" + value  unless value.match(/^http/)
  $("#link_tester").attr "href", value
  return

jQuery ->
  $('#game_developer_name').autocomplete
    source: $('#game_developer_name').data('autocomplete-source')