class Booking < ApplicationRecord
  belongs_to :user #, dependent: :destroy
  belongs_to :toothbrush #, dependent: :destroy
  has_many :reviews
  validates :user_id, presence: true
  validates :toothbrush_id, presence: true
  validates :starting_on, presence: true
  validates :ending_on, presence: true
  validates :status, inclusion: { in: ["Pending renter request", "Pending owner validation", "Confirmed", "Canceled"], allow_nil: true }
end
