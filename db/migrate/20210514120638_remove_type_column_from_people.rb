class RemoveTypeColumnFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :type
  end
end
