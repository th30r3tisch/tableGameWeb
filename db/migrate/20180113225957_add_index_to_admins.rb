class AddIndexToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_index :admins, :unlock_token, unique: true
  end
end
