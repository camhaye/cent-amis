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
  image_url: "https://i.imgur.com/WdjuE7y.jpeg")
user2 = User.create!(pseudonyme: "toto-du-33",
  email: "thomas@mail.fr",
  password: 'password',
  password_confirmation: 'password',
  image_url: "https://i.imgur.com/6VpQxPy.jpeg")
user3 = User.create!(pseudonyme: "bast1",
   email: "bastien@mail.fr",
   password: 'password',
   password_confirmation: 'password',
   image_url: "https://i.imgur.com/Mr2E09v.png")
user4 = User.create!(pseudonyme: "aceillm",
  email: "camille@mail.fr",
  password: 'password',
  password_confirmation: 'password',
  image_url: "https://i.imgur.com/NaQmXdS.png")

puts 'User generated'

puts 'Generate Friends'

 friend1 = Friend.create!(first_name: "Romain",
  city: "Bordeaux",
  location: "Place de la Comédie, 33000 Bordeaux",
  content: "Il aime la compétition, coder et jouer aux jeux vidés. Il apporte la fraicheur et les blagues douteuses.",
  available: true,
  gender: 'Homme cis',
  age: 29,
  good_at: "Gagner aux blind-tests",
  price: 30,
  image_url: "https://i.imgur.com/qzchOUX.jpeg",
  user: user2)

 friend2 = Friend.create!(first_name: "Jonathan",
  city: "Bordeaux",
  location: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux",
  content: "Il aime la géologie, enseigner, voyager et passer du temps avec ses proches. Il apporte les bons conseils et fait un excellent good cop.",
  available: true,
  gender: 'Homme cis',
  age: 39,
  good_at: "Déterminer l'origine d'un caillou",
  price: 60,
  image_url: "https://i.imgur.com/alwDgX8.jpeg",
  user: user3)

  friend3 = Friend.create!(first_name: "Anne-Cécile",
  city: "Talence",
  location: "48 Avenue de la République, 33240 Saint-André-de-Cubzac",
  content: "Elle aime et pratique la musique, boire des bières et régler les soucis de code. Elle apporte la sagesse et la communication.",
  available: true,
  gender: 'Femme cis',
  age: 35,
  good_at: "Faire bouger le dancefloor sur un solo de guitare",
  price: 5,
  image_url: "https://i.imgur.com/Vu3aciE.jpeg",
  user: user4)

  friend4 = Friend.create!(first_name: "Benoît",
    city: "Bergerac",
    location: "19 Rue Neuve d'Argenson, 24100 Bergerac",
    content: "Il aime la voile, l'aviation, les sports mécaniques (vroum vroum), les kebabs et faire le hater sur X. Il apporte la mauvaise humeur, des clopes de temps et temps et de la drogue.",
    available: true,
    gender: 'Homme cis',
    age: 35,
    good_at: "Pour écrire des avis google assassins",
    price: 20,
    image_url: "https://i.imgur.com/hnRWoG7.jpeg",
    user: user2)

  friend5 = Friend.create!(first_name: "Clément",
    city: "Fougères",
    location: "20 Place Saint-Martin, 35133 Lécousse",
    content: "Il aime le sucre, la musique électronique et sa petite fée. Il apporte le whisky, tu ramènes le coca ?",
    available: true,
    gender: 'Homme cis',
    age: 28,
    good_at: "Mettre douze sucres dans son thé le matin",
    price: 35,
    image_url: "https://i.imgur.com/BujBLFY.jpeg",
    user: user3)

  friend6 = Friend.create!(first_name: "Marine",
    city: "Libourne",
    location: "42 Place Abel Surchamp, 33500 Libourne",
    content: "Elle aime dessiner, et manger des morceaux de sucre, elle voudrait essayer les champignons hallucinogènes. Elle apporte un cadre, ses nombreuses connaissances en tout et les anecdotes de tournage de ses parents.",
    available: true,
    gender: 'Femme cis',
    age: 25,
    good_at: "S'énerver des bêtises de code de ses camarades",
    price: 25,
    user: user4)
