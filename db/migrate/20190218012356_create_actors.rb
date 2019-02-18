class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.integer :tmdb_id, index: true

      t.string :name, index: true
      t.integer :gender, default: 0

      t.string :profile_path

      t.timestamps
    end
  end
end
