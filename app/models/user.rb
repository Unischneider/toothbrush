class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :toothbrushes, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  mount_uploader :photo, PhotoUploader
  validates :address, presence: true
end
