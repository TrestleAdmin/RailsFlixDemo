class ConvertActorsToPeople < ActiveRecord::Migration[5.2]
  def change
    rename_table :actors, :people
    add_column :people, :type, :string

    Person.update_all(type: "Actor")
  end
end
