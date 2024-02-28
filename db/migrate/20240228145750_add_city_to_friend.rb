class AddCityToFriend < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :city, :string
  end
end
