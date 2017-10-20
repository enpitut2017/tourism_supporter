class Advice < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates :spot_id, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
  mount_uploader :picture, PictureUploader
end
