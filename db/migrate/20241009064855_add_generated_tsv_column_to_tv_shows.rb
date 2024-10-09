class AddGeneratedTsvColumnToTVShows < ActiveRecord::Migration[7.2]
  def up
    execute "DROP TRIGGER IF EXISTS tsvectorupdate ON tv_shows"

    remove_column :tv_shows, :tsv, :tsvector

    add_column :tv_shows, :tsv, :tsvector, as: "to_tsvector('english', coalesce(name, '') || ' ' || coalesce(overview, ''))", stored: true
    add_index :tv_shows, :tsv, using: 'gin'
  end
end
