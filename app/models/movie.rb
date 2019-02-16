class Movie < ApplicationRecord
  has_and_belongs_to_many :genres, -> { alphabetical }

  def score
    (vote_average * 10).to_i
  end

  def poster?
    poster_path.present?
  end

  def poster_url(version="original")
    "https://image.tmdb.org/t/p/#{version}#{poster_path}"
  end

  def backdrop?
    backdrop_path.present?
  end

  def backdrop_url(version="original")
    "https://image.tmdb.org/t/p/#{version}#{backdrop_path}"
  end

  def tmdb_url
    "https://www.themoviedb.org/movie/#{tmdb_id}"
  end

  def imdb_url
    "https://www.imdb.com/title/#{imdb_id}"
  end
end
