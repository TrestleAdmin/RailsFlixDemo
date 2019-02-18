module Media
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

  def backdrop?
    backdrop_path.present?
  end

  def backdrop_url(version="original")
    tmdb_image(backdrop_path, version)
  end
end
