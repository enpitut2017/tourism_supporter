class Advice < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :likes
  has_many :comments, dependent: :destroy
  validates :spot_id, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
  mount_uploader :picture, PictureUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
