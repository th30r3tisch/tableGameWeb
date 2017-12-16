class AddRoleIdToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_reference :admins, :role, foreign_key: true
  end
end
