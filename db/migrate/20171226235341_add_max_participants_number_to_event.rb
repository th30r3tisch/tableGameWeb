class AddMaxParticipantsNumberToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :max_participants, :int
  end
end
