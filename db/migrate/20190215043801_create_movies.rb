class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id, unique: true
      t.string :imdb_id

      t.string :title, index: true
      t.string :tagline
      t.string :overview
      t.string :homepage
      t.string :status
      t.integer :runtime

      t.bigint :budget
      t.bigint :revenue
      t.date :release_date, index: true

      t.string :poster_path
      t.string :backdrop_path

      t.boolean :video

      t.float :vote_average, index: true, default: 0
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
