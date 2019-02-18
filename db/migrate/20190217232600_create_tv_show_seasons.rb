class CreateTVShowSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_show_seasons do |t|
      t.references :tv_show

      t.integer :tmdb_id

      t.integer :number
      t.string :name
      t.string :overview
      t.date :air_date
      t.integer :episode_count

      t.string :poster_path

      t.timestamps
    end
  end
end
