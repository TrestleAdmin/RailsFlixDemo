class HomeController < ApplicationController
  def index
    @posters = (Movie.posters + TVShow.posters).shuffle.first(200)
  end
end
