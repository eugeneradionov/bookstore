# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#dropdown-menu li a').on 'click', ->
    $('#title').text($(this).text())

  $('#categories li a').on 'click', ->
    $('#categories li a').removeClass 'bold'
    $(this).addClass 'bold'

  $('#plus').on 'click', ->
    $('#quantity').val(Number($('#quantity').val()) + 1)

  $('#minus').on 'click', ->
    value = Number($('#quantity').val())
    if (value > 1)
      value -= 1
      $('#quantity').val(value)

$(document).on 'page:load', ->
  ready()

$(document).ready ->
  ready()
