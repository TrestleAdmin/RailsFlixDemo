class AddUniqueIndexOnPeopleTmdbId < ActiveRecord::Migration[7.0]
  def change
    # Remove duplicates
    Person.where(id: Person.select(:id, :tmdb_id).group(:tmdb_id).having("COUNT(*) > 1").pluck("MAX(id)")).delete_all

    add_index :people, :tmdb_id, unique: true
  end
end
