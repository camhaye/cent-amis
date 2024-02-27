class AddPseudonymeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pseudonyme, :string
  end
end
