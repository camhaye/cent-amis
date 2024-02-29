class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true
      t.boolean :favorite

      t.timestamps
    end
  end
end
