# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

bgg_service = BoardgameGeekService.new
    results = bgg_service.search(query)

    results.each do |item|
      create(
        name: item['name']['value'],
        description: item['description']['value'],
        year_published: item['yearpublished']['value']
        # Ajoutez d'autres attributs en fonction de ce que vous souhaitez stocker
      )
    end
