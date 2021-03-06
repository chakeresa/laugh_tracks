# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Episode.destroy_all
Director.destroy_all

tim_van_p = Director.create(name: "Tim Van Patten", birth_year: 1959, city: "Brooklyn, NY, USA", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
brian_kirk = Director.create(name: "Brian Kirk", birth_year: 1968, city: "Armagh, Northern Ireland, UK", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
alan_taylor = Director.create(name: "Alan Taylor", birth_year: 1959, city: "Brooklyn, NY, USA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
alik_s = Director.create(name: "Alik Sakharov", birth_year: 1959, city: "Tashkent, USSR", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/2/2e/Sakharov_image.jpg")
david_petrarca = Director.create(name: "David Petrarca", birth_year: 1965, city: "Warwick, RI, USA", thumbnail: "https://vignette.wikia.nocookie.net/gameofthrones/images/d/d8/David_Petrarca.jpg")

tim_van_p.episodes.create(title: "Winter is Coming", viewers: 2)
tim_van_p.episodes.create(title: "The Kingsroad", viewers: 2)
brian_kirk.episodes.create(title: "Cripples, Bastards, and Broken Things", viewers: 2)
brian_kirk.episodes.create(title: "The Wolf and the Lion", viewers: 2)
alan_taylor.episodes.create(title: "Baelor", viewers: 2)
alan_taylor.episodes.create(title: "Fire and Blood", viewers: 3)
alan_taylor.episodes.create(title: "The North Remembers", viewers: 3)
alik_s.episodes.create(title: "What is Dead May Never Die", viewers: 3)
david_petrarca.episodes.create(title: "Garden of Bones", viewers: 3)
david_petrarca.episodes.create(title: "The Ghost of Harrenhal", viewers: 3)
alan_taylor.episodes.create(title: "The Prince of Winterfell", viewers: 3)
alan_taylor.episodes.create(title: "Valar Morghulis", viewers: 4)
