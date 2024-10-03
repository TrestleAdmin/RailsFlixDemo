class AddUniqueIndexOnPeopldTmdbId < ActiveRecord::Migration[7.2]
  def change
    remove_index :people, :tmdb_id
    add_index :people, :tmdb_id, unique: true
  end
end
