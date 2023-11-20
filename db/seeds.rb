# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating account......"
Game.destroy_all
User.destroy_all


marion = User.create!(email: "marion@lewagon.org", password: "password")
jennifer = User.create!(email: "jennifer@lewagon.org", password: "password")
nicolas = User.create!(email: "nicolas@lewagon.org", password: "password")

puts "Account created !"
puts "------------------"
puts "Creating games......."
games = Game.create!([
  {
    name: 'Catan',
    number_of_players_min: 2,
    number_of_players_max: 4,
    category: 'Science Fiction',
    price: 39.99,
    user: marion
  },
  {
    name: 'Uno',
    number_of_players_min: 1,
    number_of_players_max: 4,
    category: 'Card Game',
    price: 19.99,
    user: jennifer
  },
  {
    name: 'Vilainous',
    number_of_players_min: 3,
    number_of_players_max: 6,
    category: 'Adventure',
    price: 19.99,
    user: jennifer
  }

])

puts "Games created !"
