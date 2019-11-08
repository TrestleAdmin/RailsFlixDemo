class Movie < ApplicationRecord
  include Media

  include PgSearch::Model
  pg_search_scope :pg_search, against: [:title, :tagline, :overview], using: { tsearch: { prefix: true, tsvector_column: "tsv" } }

  STATUSES = [
    "Rumored",
    "Planned",
    "In Production",
    "Post Production",
    "Released",
    "Canceled"
  ]

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "Movie::Genre"

  validates :title, :status, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  def tmdb_url
    "https://www.themoviedb.org/movie/#{tmdb_id}"
  end

  def imdb_url
    "https://www.imdb.com/title/#{imdb_id}"
  end

  def to_param
    [id, title.parameterize].join("-")
  end
end
