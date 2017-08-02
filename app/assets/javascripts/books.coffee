# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#dropdown-menu li a').on 'click', ->
  $('#title').text($(this).text())

$('#categories li a').on 'click', ->
  $('#categories li a').removeClass 'bold'
  $(this).addClass 'bold'