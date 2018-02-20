class Review < ApplicationRecord
  belongs_to :toothbrush
  belongs_to :user
  belongs_to :booking
  validates :user_id, presence: true
  validates :toothbrush_id, presence: true
  validates :content, presence: true
  validates :rating, :inclusion => { :in => 0..10 }
end
