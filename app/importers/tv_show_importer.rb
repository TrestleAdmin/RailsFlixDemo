class TVShowImporter
  def self.import(tmdb)
    tv_show = TVShow.where(tmdb_id: tmdb.id).first_or_initialize

    tv_show.name     = tmdb.name
    tv_show.overview = tmdb.overview
    tv_show.homepage = tmdb.homepage
    tv_show.status   = tmdb.status

    tv_show.first_air_date = tmdb.first_air_date
    tv_show.last_air_date  = tmdb.last_air_date

    tv_show.poster_path   = tmdb.poster_path
    tv_show.backdrop_path = tmdb.backdrop_path

    tv_show.vote_average = tmdb.vote_average
    tv_show.vote_count   = tmdb.vote_count

    tv_show.genres = tmdb.genres.map { |g| TVShow::Genre.where(name: g.name).first_or_create }

    tv_show.save!
  end
end
