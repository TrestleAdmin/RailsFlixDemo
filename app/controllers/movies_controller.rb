class MoviesController < MediaController
  include Trestle::Auth::Controller::Authentication
  before_action :require_authenticated_user

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
