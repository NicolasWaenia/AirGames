class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :comment, presence: true
  RATES = [1, 2, 3, 4, 5]
  validates :rating, presence: true
  validates :rating, inclusion: { in: RATES }
end
