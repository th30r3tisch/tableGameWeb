class ChangePlayerEventDependency < ActiveRecord::Migration[5.1]
  def change
	  drop_table :events_player_dependencies
	  create_table :events_player_dependencies, id: false do |t|
      t.references :admin,  foreign_key: true
      t.references :event,  foreign_key: true
    end
  end
end
