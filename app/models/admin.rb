class Admin < ApplicationRecord
	belongs_to :role
	before_create :set_default_role # or before_validation :set_default_role
	has_many :comments
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	# :recoverable, :rememberable, :validatable
 	devise :database_authenticatable, :registerable, :rememberable, :trackable
	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
	has_and_belongs_to_many :events

  private

  	def set_default_role
    	self.role ||= Role.find_by_name('registered')
  	end
end
