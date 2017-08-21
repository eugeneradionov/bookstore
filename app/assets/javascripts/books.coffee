# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#dropdown-menu li a').on 'click', ->
    $('#title').text($(this).text())

  $('#categories li a').on 'click', ->
    $('#categories li a').removeClass 'bold'
    $(this).addClass 'bold'

  $('.fa-plus').on 'click', ->
    input = $(this).parent().children('#quantity')
    input.val(Number(input.val()) + 1)

  $('.fa-minus').on 'click', ->
    input = $(this).parent().children('#quantity')
    value = Number(input.val())
    if (value > 1)
      input.val(value - 1)

$(document).ready ->
  ready()
