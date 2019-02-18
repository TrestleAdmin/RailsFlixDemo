class CreateTVShows < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_shows do |t|
      t.integer :tmdb_id, unique: true

      t.string :name, index: true
      t.string :overview
      t.string :homepage
      t.string :status

      t.date :first_air_date
      t.date :last_air_date

      t.string :poster_path
      t.string :backdrop_path

      t.float :vote_average, index: true, default: 0
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
