class AddUserToComments < ActiveRecord::Migration[5.1]
  def change
	drop_table :comments
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :game, foreign_key: true
	  t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
