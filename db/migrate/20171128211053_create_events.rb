class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :startDate
      t.datetime :endDate
      t.text :description
      t.string :ort

      t.timestamps
  	end
	  
  end
end
