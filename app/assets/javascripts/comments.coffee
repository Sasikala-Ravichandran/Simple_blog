# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.client = new Faye.Client('/faye')

$(document).on "page:change", -> 
  $("#comments-link").click (event) ->
     event.preventDefault()
     $(".comments_wrapper").fadeToggle()
     $("#comment_body").focus()

  client.subscribe '/comments', (payload) ->
    $('.comments').append(payload.message) if payload.message
    $("#comment_body").val("");

  $('#new_comment').submit -> $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)