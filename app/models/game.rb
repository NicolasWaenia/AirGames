class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings

  validates :number_of_players_min, inclusion: { in: 1..6 }
  validates :number_of_players_max, inclusion: { in: 1..16 }
  validates :category, inclusion: ["Card Game", "Adventure", "Farming", "Music", "Party Game", "Science Fiction", "Negotiation", "Children's Game", "Action/Dexterity", "Bluffing", "Murder/Mystery"]
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
