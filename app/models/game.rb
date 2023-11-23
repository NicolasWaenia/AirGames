class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  has_many :reviews

  validates :number_of_players_min, inclusion: { in: 1..6 }
  validates :number_of_players_max, inclusion: { in: 1..16 }
  validates :category, inclusion: ["Card Game", "Adventure", "Farming", "Music", "Party Game", "Science Fiction", "Negotiation", "Children's Game", "Action/Dexterity", "Bluffing", "Murder/Mystery"]

  validates :price, numericality: { greater_than_or_equal_to: 0.5 }

  def average_rating
    if reviews.exists?
      total_ratings = reviews.pluck(:rating) # Récupère toutes les notations des commentaires
      average = total_ratings.sum.to_f / total_ratings.count # Calcul de la moyenne
      average.round(1) # Arrondi à un décimal pour la clarté
    else
      0 # Si aucun commentaire avec une notation n'existe, la moyenne est 0
    end
  end

  

    include PgSearch::Model

    pg_search_scope :search_by_name_and_category,
      against: [:name, :category],
      using: {
        tsearch: { prefix: true }
      }


end
