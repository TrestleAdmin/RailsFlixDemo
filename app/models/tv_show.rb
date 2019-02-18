class TVShow < ApplicationRecord
  include Media

  STATUSES = [
    'Returning Series',
    'Planned',
    'In Production',
    'Ended',
    'Canceled',
    'Pilot'
  ]

  has_many :credits, -> { ordered }, as: :media
  has_many :seasons, -> { ordered }, inverse_of: :tv_show

  has_many :videos, as: :media

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "TVShow::Genre"

  validates :name, :status, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  def tmdb_url
    "https://www.themoviedb.org/tv/#{tmdb_id}"
  end
end
