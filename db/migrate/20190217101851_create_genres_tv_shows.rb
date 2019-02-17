class CreateGenresTVShows < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_tv_shows, id: false do |t|
      t.references :genre
      t.references :tv_show
    end
  end
end
