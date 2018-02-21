class Toothbrush < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader
end
