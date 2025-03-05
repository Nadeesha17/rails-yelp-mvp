# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Creating restaurants..."
Restaurant.create(name: "Epicure", address: "75008 Paris", phone_number: "123456789", category: "french")
Restaurant.create(name: "Sushi Samba", address: "London", phone_number: "987654321", category: "japanese")
Restaurant.create(name: "Pizza Napoli", address: "Rome", phone_number: "567891234", category: "italian")
Restaurant.create(name: "Waffles & More", address: "Brussels", phone_number: "654321987", category: "belgian")
Restaurant.create(name: "Dim Sum House", address: "Hong Kong", phone_number: "741852963", category: "chinese")
puts "Finished!"
