class AddcategoryToGames < ActiveRecord::Migration[5.1]
  def change
  remove_column :games, :gameType
	add_reference :games, :category_tag, foreign_key: true
  end
end
