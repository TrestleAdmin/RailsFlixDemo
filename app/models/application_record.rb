class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

protected
  def tmdb_image(path, version="original")
    "https://image.tmdb.org/t/p/#{version}#{path}"
  end
end
