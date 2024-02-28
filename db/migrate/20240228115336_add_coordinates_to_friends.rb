class AddCoordinatesToFriends < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :latitude, :float
    add_column :friends, :longitude, :float
  end
end
