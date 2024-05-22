class VideoGalleryController extends Trestle.Controllers.gallery {
  static targets = ["video"]

  get options () {
    return {
      ...super.options,
      type: 'iframe'
    }
  }

  get lightboxTarget () {
    return this.videoTargets
  }
}

Stimulus.register('video-gallery', VideoGalleryController)
