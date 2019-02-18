class Image < ApplicationRecord
  belongs_to :media, polymorphic: true

  scope :posters, -> { where(image_type: "Poster") }
  scope :backdrops, -> { where(image_type: "Backdrop") }

  def url(version="original")
    tmdb_image(file_path, version)
  end
end
