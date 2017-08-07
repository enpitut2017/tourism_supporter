class Spot < ApplicationRecord
  has_many :advices
  mount_uploader :picture, PictureUploader
  validates :placeName, presence: true,
            uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :picture, presence: true
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['placeName LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
end
