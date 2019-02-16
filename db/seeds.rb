# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'throttler'
throttle = Throttler.new(4)

# Pages of movies / TV shows to fetch
PAGES = 3

# Import movie genres
Tmdb::Genre.movie_list.each do |genre|
  Movie::Genre.where(name: genre.name).first_or_create
end

# Import movies from TheMovieDB.org
(1..PAGES).each do |page|
  response = throttle.t { Tmdb::Movie.popular(page: page) }
  response.results.each do |stub|
    movie = throttle.t { Tmdb::Movie.detail(stub.id) }

    $stdout.write "\e[A\e[2K"
    $stdout.write "Importing #{movie.title}...\n"

    MovieImporter.import(movie)
  end
end
