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

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "TVShow::Genre"

  def tmdb_url
    "https://www.themoviedb.org/tv/#{tmdb_id}"
  end
end
