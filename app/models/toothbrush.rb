class Toothbrush < ApplicationRecord
  belongs_to :user #, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader
end
