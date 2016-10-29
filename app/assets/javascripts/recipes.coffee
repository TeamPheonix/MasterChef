# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  template = "<textarea name='ingredient[content][INDEX]'></textarea>"
  index = $('textarea').length
  $('#js-add-ingredient-row').click ->
    compiled_textarea = $(template.replace("INDEX", index))
    $('#ingredients').append(compiled_textarea)
    index = index + 1;
