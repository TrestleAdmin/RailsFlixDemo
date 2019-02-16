class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :type
      t.string :name

      t.timestamps

      t.index [:type, :name]
    end
  end
end
