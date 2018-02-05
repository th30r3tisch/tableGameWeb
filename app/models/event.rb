class Event < ApplicationRecord
	belongs_to :game
	has_and_belongs_to_many :admins
	belongs_to :organizer , class_name: "Admin", foreign_key: "admin_id" #maybe useless referenz because habtm admins?
	#has_many :comments, dependent: :destroy

	validates :game, presence: true
	validates :startDate, presence: true
	validates :endDate, presence: true
	validates :ort, presence: true
	validates :name, presence: true, length: { minimum: 5 }
end
