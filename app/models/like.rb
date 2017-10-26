class Like < ApplicationRecord
  belongs_to :advice, counter_cache: :likes_count
  belongs_to :user
end
