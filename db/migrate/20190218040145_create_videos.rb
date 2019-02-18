class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :media, polymorphic: true

      t.string :name
      t.string :site
      t.string :key
      t.string :video_type

      t.timestamps
    end
  end
end
