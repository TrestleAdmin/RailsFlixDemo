class AddTsvectorIndexToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :tsv, :tsvector
    add_index :movies, :tsv, using: 'gin'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON movies
          FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(tsv, 'pg_catalog.simple', title, tagline, overview);
        SQL

        # Trigger re-index on existing movies
        execute("UPDATE movies SET id = id")
      end

      dir.down { execute("DROP TRIGGER IF EXISTS tsvectorupdate ON movies") }
    end
  end
end
