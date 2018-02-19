class Review < ApplicationRecord
  belongs_to :toothbrush
  belongs_to :user
end
