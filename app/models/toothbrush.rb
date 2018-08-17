class Toothbrush < ApplicationRecord
  belongs_to :user #, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :user_id, presence: true
  validates :name, length: { minimum: 6 }

  mount_uploader :photo, PhotoUploader

  # def Toothbrush.age
  #   20
  # end

end
