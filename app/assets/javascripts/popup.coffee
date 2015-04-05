$ ->
  $('#popup_create').on 'click', ->
    $('body').addClass('body-popup_open');
    $('.popup-overlay').show()
    $('#form_popup').css('display', 'block')
    false

  $('#popup_show').on 'click', ->
      $('body').addClass('body-popup_open');
      $('.popup-overlay').show()
      $('#show_popup').css('display', 'block')
      false

