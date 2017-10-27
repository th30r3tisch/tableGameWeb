class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :playtime
      t.integer :maxPlayer
      t.string :gameType
      t.integer :releaseYear
      t.string :pictureUrl

      t.timestamps
    end
  end
end
