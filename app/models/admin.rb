class Admin < ApplicationRecord
	before_validation :set_default_role, on: :create

	belongs_to :role
	has_many :comments
	has_and_belongs_to_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	# :recoverable, :rememberable, :validatable
 	devise :database_authenticatable, :registerable, :rememberable, :trackable
	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

	validates :nickname, presence: true

  private

  	def set_default_role
    	self.role ||= Role.find_by_name('user')
  	end
end
