class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :location
      t.text :content
      t.boolean :available
      t.integer :age
      t.string :good_at
      t.string :gender
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
