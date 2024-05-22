class Movie::Genre < Genre
  has_and_belongs_to_many :movies

  def media
    "Movie"
  end
end
