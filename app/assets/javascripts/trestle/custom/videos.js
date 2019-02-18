Trestle.init(function(e, root) {
  $(root).find('[data-behavior~="video-gallery"]').magnificPopup({
    delegate: 'a',
    type: 'iframe',
    closeOnContentClick: false,
    closeBtnInside: false,
    mainClass: 'mfp-with-zoom mfp-img-mobile',
    gallery: {
      enabled: true
    },
    zoom: {
      enabled: true,
      duration: 150
    }
  });
});
