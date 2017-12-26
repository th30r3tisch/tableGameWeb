class AddPictureUrlToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :picture_url, :string
  end
end
