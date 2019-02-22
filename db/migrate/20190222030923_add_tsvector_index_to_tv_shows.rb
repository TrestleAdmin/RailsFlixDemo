class AddTsvectorIndexToTVShows < ActiveRecord::Migration[5.2]
  def change
    add_column :tv_shows, :tsv, :tsvector
    add_index :tv_shows, :tsv, using: 'gin'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON tv_shows
          FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(tsv, 'pg_catalog.simple', name, overview);
        SQL

        # Trigger re-index on existing TV shows
        execute("UPDATE tv_shows SET id = id")
      end

      dir.down { execute("DROP TRIGGER IF EXISTS tsvectorupdate ON tv_shows") }
    end
  end
end
