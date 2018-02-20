class Toothbrush < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  validates :user_id, presence: true
end
