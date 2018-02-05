class AddOrganizerAndPublicToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :admin , foreign_key: true
    add_column :events, :public, :boolean, default: true
  end
end
