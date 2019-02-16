class CreateGenresMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_movies, id: false do |t|
      t.references :genre
      t.references :movie
    end
  end
end
