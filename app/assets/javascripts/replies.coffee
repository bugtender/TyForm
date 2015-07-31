# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $( "#sortable" ).sortable
    axis:'y'
    handle: '.handle'

  $(".submit-form").click ->
    $('.field_pos').each (index) ->
      $(this).val(index+1)