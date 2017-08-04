class Advice < ApplicationRecord
  belongs_to :spot
  validates :spot_id, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
  mount_uploader :picture, PictureUploader
end
