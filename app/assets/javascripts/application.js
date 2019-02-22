// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap/js/dist/util
//= require bootstrap/js/dist/collapse
//= require bootstrap/js/dist/tab
//= require magnific-popup/dist/jquery.magnific-popup

$(document).on('ready turbolinks:load', function() {
  $('[data-behavior="video"]').magnificPopup({
    type: 'iframe',
    preloader: false
  })

  $('[data-behavior="gallery"]').each(function() {
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
