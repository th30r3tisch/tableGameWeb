class AddNicknameToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :nickname, :string, null: false
    add_index :admins, :nickname, unique: true
  end
end
