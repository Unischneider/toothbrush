class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :toothbrush, dependent: :destroy
  validates :user_id, presence: true
  validates :toothbrush_id, presence: true
end
