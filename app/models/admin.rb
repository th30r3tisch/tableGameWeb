class Admin < ApplicationRecord
	before_validation :set_default_role, on: :create

	belongs_to :role
	has_many :comments
	has_and_belongs_to_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	# :recoverable, :rememberable, :validatable
	devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :timeout_in => 30.minutes

	validates :nickname, presence: true
	mount_uploader :picture_url, ImageUploader
	validates_processing_of :picture_url
	validate :image_size_validation

  private

	def image_size_validation
		errors[:picture_url] << "should be less than 500KB" if picture_url.size > 0.5.megabytes
	end

  def set_default_role
  	self.role ||= Role.find_by_name('user')
  end
end
