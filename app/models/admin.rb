class Admin < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	# :recoverable, :rememberable, :validatable
 	devise :database_authenticatable, :registerable, :rememberable, :trackable
	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
