module Media
  extend ActiveSupport::Concern

  included do
    has_many :acting_credits, -> { actors.ordered }, as: :media
    has_many :crew_credits, -> { crew.ordered }, as: :media

    has_many :videos, as: :media
    has_many :images, as: :media

    scope :posters, -> { where.not(poster_path: [nil, ""]).select(:poster_path) }
  end

  def score
    (vote_average * 10).to_i
  end

  def media_count
    count = videos.count + images.count
    count += 1 if backdrop?
    count
  end

  def poster?
    poster_path.present?
  end

  def poster_url(version="original")
    tmdb_image(poster_path, version)
  end

  def poster_count
    count = images.posters.count
    poster? ? count + 1 : count
  end

  def backdrop?
    backdrop_path.present?
  end

  def backdrop_url(version="original")
    tmdb_image(backdrop_path, version)
  end

  def backdrop_count
    count = images.backdrops.count
    backdrop? ? count + 1 : count
  end

  def trailer
    videos.find_by(video_type: "Trailer")
  end
end
