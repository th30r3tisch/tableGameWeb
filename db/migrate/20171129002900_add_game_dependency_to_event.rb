class AddGameDependencyToEvent < ActiveRecord::Migration[5.1]
  def change
	add_reference :events, :game, foreign_key: true
  end
end
