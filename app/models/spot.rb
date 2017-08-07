class Spot < ApplicationRecord
  has_many :advices
  mount_uploader :picture, PictureUploader
  validates :placeName, presence: true,
            uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :picture, presence: true
end
