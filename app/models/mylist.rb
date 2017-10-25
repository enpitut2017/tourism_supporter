class Mylist < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates :user_id, presence: true
  validates :spot_id, presence: true
end
