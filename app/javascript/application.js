import '@hotwired/turbo-rails'
import $ from 'jquery'

import 'magnific-popup'

require('bootstrap/js/dist/util')
require('bootstrap/js/dist/collapse')
require('bootstrap/js/dist/tab')

$(document).on('ready turbo:load', function () {
  $('.poster-grid li').css({ opacity: 0, transform: 'scale(0.25)' })
  $('.poster-grid img').on('load', function () {
    $(this).parent().css({ opacity: 1, transform: 'scale(1)' })
  })

  $('[data-behavior="video"]').magnificPopup({
    type: 'iframe',
    preloader: false
  })

  $('[data-behavior="gallery"]').each(function () {
    $(this).magnificPopup({
      delegate: 'a',
      type: 'image',
      gallery: {
        enabled: true,
        navigationByImgClick: true,
        preload: [0, 1]
      }
    })
  })
})
