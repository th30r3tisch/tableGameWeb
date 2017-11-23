class Comment < ApplicationRecord
  belongs_to :game
  belongs_to :author , class_name: "Admin", foreign_key: "admin_id"
end
