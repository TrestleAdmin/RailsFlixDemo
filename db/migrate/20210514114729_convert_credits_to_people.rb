class ConvertCreditsToPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :credits, :actor_id, :person_id
    rename_column :credits, :character, :role
    add_column :credits, :type, :string

    Credit.update_all(type: "ActingCredit")
  end
end
