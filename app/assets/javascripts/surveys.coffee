# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# window.onpageshow  = () ->
# doesn't work if click on back button
$(document).on 'turbolinks:load', ->
  $('.survey').click (e) ->
    if (e.target.nodeName isnt 'I' and e.target.nodeName isnt 'BUTTON')
      redirectTo $(this).data('redirect')
    return true
