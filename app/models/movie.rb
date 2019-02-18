class Movie < ApplicationRecord
  include Media

  STATUSES = [
    "Rumored",
    "Planned",
    "In Production",
    "Post Production",
    "Released",
    "Canceled"
  ]

  has_many :credits, -> { ordered }, as: :media

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "Movie::Genre"

  validates :title, :status, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  def tmdb_url
    "https://www.themoviedb.org/movie/#{tmdb_id}"
  end

  def imdb_url
    "https://www.imdb.com/title/#{imdb_id}"
  end
end
