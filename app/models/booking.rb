class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :status, presence: true, inclusion: ["pending", "accepted", "refused"]
end
