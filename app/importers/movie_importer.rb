class MovieImporter
  def self.import(tmdb)
    movie = Movie.where(tmdb_id: tmdb.id).first_or_initialize

    movie.imdb_id = tmdb.imdb_id

    movie.title    = tmdb.title
    movie.tagline  = tmdb.tagline
    movie.overview = tmdb.overview
    movie.homepage = tmdb.homepage
    movie.status   = tmdb.status
    movie.runtime  = tmdb.runtime

    movie.budget  = tmdb.budget
    movie.revenue = tmdb.revenue
    movie.release_date = tmdb.release_date

    movie.poster_path   = tmdb.poster_path
    movie.backdrop_path = tmdb.backdrop_path

    movie.video = tmdb.video

    movie.vote_average = tmdb.vote_average
    movie.vote_count   = tmdb.vote_count

    movie.genres = tmdb.genres.map { |g| Movie::Genre.where(name: g.name).first_or_create }

    movie.save!
  end
end
