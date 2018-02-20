class Toothbrush < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_many :reviews
  validates :user_id, presence: true
end
