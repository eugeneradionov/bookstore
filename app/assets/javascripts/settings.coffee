$(document).ready ->
  $('#delete_account_checkbox').change ->
    if ($('#user_confirm:checked').length)
      $('#delete_account_button').removeClass('disabled');
      $('#delete_account_button').attr('disabled', false);
    else
      $('#delete_account_button').addClass('disabled');
      $('#delete_account_button').attr('disabled', true);