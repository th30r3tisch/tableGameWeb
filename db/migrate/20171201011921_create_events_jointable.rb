class CreateEventsJointable < ActiveRecord::Migration[5.1]
  def change
	  create_table :admins_events, id: false do |t|
      t.belongs_to :admin, index: true
      t.belongs_to :event, index: true
    end
  end
end
