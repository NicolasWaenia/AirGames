class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :status, presence: true, inclusion: ["pending", "accepted", "refused"]
  validates :total_price, numericality: { greater_than_or_equal_to: 0.5 }
end
