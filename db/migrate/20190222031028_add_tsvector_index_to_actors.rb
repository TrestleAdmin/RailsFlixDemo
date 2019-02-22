class AddTsvectorIndexToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :tsv, :tsvector
    add_index :actors, :tsv, using: 'gin'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON actors
          FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(tsv, 'pg_catalog.simple', name);
        SQL

        # Trigger re-index on existing actors
        execute("UPDATE actors SET id = id")
      end

      dir.down { execute("DROP TRIGGER IF EXISTS tsvectorupdate ON actors") }
    end
  end
end
