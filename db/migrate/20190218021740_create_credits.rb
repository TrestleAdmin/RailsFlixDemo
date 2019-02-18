class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.references :media, polymorphic: true
      t.references :actor

      t.string :character
      t.integer :order

      t.timestamps
    end
  end
end
