class Game < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :events, dependent: :destroy
	belongs_to :category_tag

  validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true, length: { minimum: 5 }
	validates :category_tag, presence: true

	mount_uploader :pictureUrl, ImageUploader
	validates_processing_of :pictureUrl
	validate :image_size_validation

	private
	  def image_size_validation
		errors[:pictureUrl] << "should be less than 500KB" if pictureUrl.size > 0.5.megabytes
	  end
end
