class Spot < ApplicationRecord
  has_many :advices
  validates :placeName, presence: true,
            uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :picture, presence: true
end
