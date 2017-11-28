class Game < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :events
	
  	validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true, length: { minimum: 5 }
	validates :gameType, presence: true
end
