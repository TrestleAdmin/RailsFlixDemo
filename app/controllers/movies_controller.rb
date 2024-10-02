class MoviesController < MediaController
  def index
    @movies = paginate(Movie)
  end

  def show
    @movie = Movie.find(params[:id])

    @credits   = @movie.acting_credits.includes(:person)
    @videos    = @movie.videos
    @posters   = @movie.images.posters
    @backdrops = @movie.images.backdrops
  end
end
