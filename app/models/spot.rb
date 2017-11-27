class Spot < ApplicationRecord
  has_many :advices
  has_many :mylists
  belongs_to :create_user, class_name: "User"
  validates :place_name, presence: true,
            uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['place_name LIKE(?)', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end

  def self.default_picture
    "no_image.png"
  end

  def picture
    advice = advices.where.not(picture: nil).order(likes_count: :desc).first
    if advice.present?
      advice.picture
    else
      Spot.default_picture
    end
  end

  def mylist_user(user_id)
    mylists.find_by(user_id: user_id)
  end
end
