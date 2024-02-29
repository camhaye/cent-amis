class AddDefaulImageToFriends < ActiveRecord::Migration[7.1]
  def change
    change_column :friends, :image_url, :string, default: "https://i.imgur.com/eKe0xfN.png"
    change_column :users, :image_url, :string, default: "https://i.imgur.com/WdjuE7y.jpeg"
  end
end
