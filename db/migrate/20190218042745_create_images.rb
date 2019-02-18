class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :media, polymorphic: true

      t.string :image_type
      t.string :file_path

      t.timestamps
    end
  end
end
