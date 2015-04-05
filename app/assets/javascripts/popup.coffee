$ ->
  $('#popup_create').on 'click', ->
    $('body').addClass('body-popup_open');
    $('.popup-overlay').show()
    $('#form_popup').css('display', 'block')
    false
