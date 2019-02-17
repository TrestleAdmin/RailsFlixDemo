class Movie < ApplicationRecord
  include Media

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "Movie::Genre"

  def tmdb_url
    "https://www.themoviedb.org/movie/#{tmdb_id}"
  end

  def imdb_url
    "https://www.imdb.com/title/#{imdb_id}"
  end
end
