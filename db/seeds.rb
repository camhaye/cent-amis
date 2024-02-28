# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts 'D database'

User.destroy_all

puts 'G user'

user1 = User.create!(pseudonyme: "Admin",
  email: "admin@mail.fr",
  password: 'password',
  password_confirmation: 'password',
  image_url: "https://i.imgur.com/rBvxcII.jpeg")
user2 = User.create!(pseudonyme: "Thomas",
  email: "thomas@mail.fr",
  password: 'password',
  password_confirmation: 'password')
user3 = User.create!(pseudonyme: "Bastien",
   email: "bastien@mail.fr",
   password: 'password',
   password_confirmation: 'password')
user4 = User.create!(pseudonyme: "Camille",
  email: "camille@mail.fr",
  password: 'password',
  password_confirmation: 'password')

puts 'User generated'

puts 'Generate Friends'
friend1 = Friend.create!(first_name: "Camille",
  city: "Toulouse",
  location: "3 place Saint-Sernin, 31000 Toulouse",
  content: "Elle aime la littérature, enseigner et passer des heures à regarder des films. Elle apporte la joie, la bonne humeur (ish) et les blagues bizarres.",
  gender: "Femme cis",
  available: true,
  age: 25,
  good_at: "Raconter et écrire de belles histoires",
  price: 15,
  image_url: "https://i.imgur.com/aUHzx5S.jpeg",
  user: user1)


 friend2 = Friend.create!(first_name: "Bastien",
  city: "Bayonne",
  location: "Quai Dominique Roquebert, 64100 Bayonne",
  content: "Il aime le surf, le pingpong (en ce moment et quand il gagne), la musique et sortir le soir. Il apporte les bières, la joie de vivre et les blagues de beauf.",
  available: true,
  gender: 'Homme cis',
  age: 25,
  good_at: "Faire de la musique",
  price: 40,
  image_url: "https://i.imgur.com/x1VLsma.jpeg",
  user: user1)


 friend3 = Friend.create!(first_name: "Thomas",
  city: "Bordeaux",
  location: "Bordeaux",
  content: "Il aime les sports d'eau vive, passer du temps avec ses proches et voyager. Il apporte la sérénité, la bonne humeur et s'illustre dans l'humour pince-sans-rire.",
  available: true,
  gender: 'Homme cis',
  age: 45,
  good_at: "Faire la cuisine",
  price: 40,
  image_url: "https://i.imgur.com/gOKIIk2.jpeg",
  user: user1)


 friend4 = Friend.create!(first_name: "Romain",
  city: "Bordeaux",
  location: "Place de la Comédie, 33000 Bordeaux",
  content: "Il aime la compétition, coder et jouer aux jeux vidés. Il apporte la fraicheur et les blagues douteuses.",
  available: true,
  gender: 'Homme cis',
  age: 29,
  good_at: "Gagner aux blind-tests",
  price: 30,
  image_url: "https://i.imgur.com/qzchOUX.jpeg",
  user: user1)


 friend5 = Friend.create!(first_name: "Jonathan",
  city: "Bordeaux",
  location: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux",
  content: "Il aime la géologie, enseigner, voyager et passer du temps avec ses proches. Il apporte les bons conseils et fait un excellent good cop.",
  available: true,
  gender: 'Homme cis',
  age: 39,
  good_at: "Déterminer l'origine d'un caillou",
  price: 60,
  image_url: "https://i.imgur.com/alwDgX8.jpeg",
  user: user1)


friend6 = Friend.create!(first_name: "Anne-Cécile",
  city: "Saint-André-de-Cubzac",
  location: "48 Avenue de la République, 33240 Saint-André-de-Cubzac",
  content: "Elle aime et pratique la musique, boire des bières et régler les soucis de code. Elle apporte la sagesse et la communication.",
  available: true,
  gender: 'Femme cis',
  age: 35,
  good_at: "Faire bouger le dancefloor sur un solo de guitare",
  price: 5,
  image_url: "https://i.imgur.com/Vu3aciE.jpeg",
  user: user1)

  Booking.create!(start_date: '2024-03-18',
    end_date: '2024-03-19',
    user: user2,
    friend: friend1,
    total: 80)

  Booking.create!(start_date: '2024-03-18',
    end_date: '2024-03-19',
    user: user3,
    friend: friend2,
    status: "pending",
    total: 80)