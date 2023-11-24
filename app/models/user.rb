class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :bookings
  has_many :reviews
  has_one_attached :profile_picture
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :city, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address? # after validation?
end
