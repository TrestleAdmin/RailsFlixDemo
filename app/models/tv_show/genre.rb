class TVShow::Genre < Genre
  has_and_belongs_to_many :tv_shows

  def media
    "TV Show"
  end
end
