class AddDefaultValueToAvailable < ActiveRecord::Migration[7.1]
  def change
    change_column :friends, :available, :boolean, default: true
  end
end
