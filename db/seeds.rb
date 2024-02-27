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

User.create(pseudonyme: "Admin",
  email: "admin@mail.fr",
  password: 'password',
  password_confirmation: 'password')
User.create(pseudonyme: "Thomas",
  email: "thomas@mail.fr",
  password: 'password',
  password_confirmation: 'password')
User.create(pseudonyme: "Bastien",
   email: "bastien@mail.fr",
   password: 'password',
   password_confirmation: 'password')
User.create(pseudonyme: "Camille",
  email: "camille@mail.fr",
  password: 'password',
  password_confirmation: 'password')

puts 'User generated'

puts 'Generate Friends'
Friend.create(first_name: "Camille",
  location: "Toulouse",
  content: "Elle aime la littérature, enseigner et passer des heures à regarder des films. Elle apporte la joie, la bonne humeur (ish) et les blagues bizarres.",
  gender: "Femme cis",
  available: true,
  age: 25,
  good_at: "Raconter et écrire de belles histoires",
  price: 15,
  image_url: "https://i.imgur.com/aUHzx5S.jpeg",
  user_id: 1)


 Friend.create(first_name: "Bastien",
  location: "Bayonne",
  content: "Il aime le surf, le pingpong (en ce moment et quand il gagne), la musique et sortir le soir. Il apporte les bières, la joie de vivre et les blagues de beauf.",
  available: true,
  gender: 'Homme cis',
  age: 25,
  good_at: "Faire de la musique",
  price: 40,
  image_url: "https://i.imgur.com/x1VLsma.jpeg",
  user_id: 1)


 Friend.create(first_name: "Thomas",
  location: "Bordeaux",
  content: "Il aime les sports d'eau vive, passer du temps avec ses proches et voyager. Il apporte la sérénité, la bonne humeur et s'illustre dans l'humour pince-sans-rire.",
  available: true,
  gender: 'Homme cis',
  age: 45,
  good_at: "Faire la cuisine",
  price: 40,
  image_url: "https://i.imgur.com/gOKIIk2.jpeg",
  user_id: 1)


 Friend.create(first_name: "Romain",
  location: "Bordeaux",
  content: "Il aime la compétition, coder et jouer aux jeux vidés. Il apporte la fraicheur et les blagues douteuses.",
  available: true,
  gender: 'Homme cis',
  age: 29,
  good_at: "Gagner aux blind-tests",
  price: 30,
  image_url: "https://i.imgur.com/qzchOUX.jpeg",
  user_id: 1)


 Friend.create(first_name: "Jonathan",
  location: "Bordeaux",
  content: "Il aime la géologie, enseigner, voyager et passer du temps avec ses proches. Il apporte les bons conseils et fait un excellent good cop.",
  available: true,
  gender: 'Homme cis',
  age: 39,
  good_at: "Déterminer l'origine d'un caillou",
  price: 60,
  image_url: "https://i.imgur.com/alwDgX8.jpeg",
  user_id: 1)


 Friend.create(first_name: "Anne-Cécile",
  location: "Bordeaux",
  content: "Elle aime et pratique la musique, boire des bières et régler les soucis de code. Elle apporte la sagesse et la communication.",
  available: true,
  gender: 'Femme cis',
  age: 35,
  good_at: "Faire bouger le dancefloor sur un solo de guitare",
  price: 5,
  image_url: "https://i.imgur.com/Vu3aciE.jpeg",
  user_id: 1)

  Booking.create(start_date: '2024-03-18',
    end_date: '2024-03-19',
    user_id: 4,
    friend_id: 2,
    total: 80)
