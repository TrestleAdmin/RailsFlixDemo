class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

protected
  def tmdb_image(path, version="original")
    "https://image.tmdb.org/t/p/#{version}#{path}"
  end
end
