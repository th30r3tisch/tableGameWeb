class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.text :description
      t.string :ort

      t.timestamps
  	end
	  
 
    create_table :events_player_dependencies, id: false do |t|
      t.belongs_to :admin, index: true
      t.belongs_to :event, index: true
    end
  end
end
