class AddGeneratedTsvColumnToMovies < ActiveRecord::Migration[7.2]
  def up
    execute "DROP TRIGGER IF EXISTS tsvectorupdate ON movies"

    remove_column :movies, :tsv, :tsvector

    add_column :movies, :tsv, :tsvector, as: "to_tsvector('english', coalesce(title, '') || ' ' || coalesce(tagline, '') || ' ' || coalesce(overview, ''))", stored: true
    add_index :movies, :tsv, using: 'gin'
  end
end
