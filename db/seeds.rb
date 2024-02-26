# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts 'Generate user'

User.create(email: "admin@mail.fr", password: 'password', password_confirmation: 'password')
User.create(email: "thomas@mail.fr", password: 'password', password_confirmation: 'password')
User.create(email: "bastien@mail.fr", password: 'password', password_confirmation: 'password')



puts 'User generated'

puts 'Generate Friends'
Friend.create(first_name: "Camille", location: "Bordeaux", content:"J'aime la littératures", gender: "Womem", available: true, age: 25, good_at: "Raconter des histoires", price: 40, user_id: 1)
Friend.create(first_name: "Bastien", location: "Bayonne", content:"Je surf ", available: true, gender: 'Man', age: 25, good_at: "Faire de la musique", price: 40, user_id: 1)
Friend.create(first_name: "Thomas", location: "Bordeaux", content:"J'aime faire du sport", available: true, gender: 'Man', age: 40, good_at: "Faire du sport", price: 40, user_id: 1)
Friend.create(first_name: "Jean-paul", location: "Paris", content:"J'aime les jeux de sociétés", available: true, gender: 'Men', age: 28, good_at: "Aller au bar", price: 40, user_id: 1)
puts 'generated friends'
