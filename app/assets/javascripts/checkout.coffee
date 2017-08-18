# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#use_billing_address').change ->
    if ($('#checkout_use_billing_address:checked').length)
      $('#shipping_address_form').slideUp('slow');
    else
      $('#shipping_address_form').slideDown('slow');