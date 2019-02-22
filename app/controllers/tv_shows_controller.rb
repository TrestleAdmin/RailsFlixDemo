class TVShowsController < MediaController
  def index
    @tv_shows = paginate(TVShow)
  end

  def show
    @tv_show = TVShow.find(params[:id])

    @credits   = @tv_show.credits.includes(:actor)
    @seasons   = @tv_show.seasons
    @videos    = @tv_show.videos
    @posters   = @tv_show.images.posters
    @backdrops = @tv_show.images.backdrops
  end
end
