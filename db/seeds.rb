# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Episode.destroy_all
Director.destroy_all

tim_van_p = Director.create(name: "Tim Van Patten", age: 59, city: "Brooklyn, NY, USA")
brian_kirk = Director.create(name: "Brian Kirk", age: 50, city: "Armagh, Northern Ireland, UK")
alan_taylor = Director.create(name: "Alan Taylor", age: 59, city: "Brooklyn, NY, USA")

tim_van_p.episodes.create(title: "Winter is Coming", viewers: 2)
tim_van_p.episodes.create(title: "The Kingsroad", viewers: 2)
brian_kirk.episodes.create(title: "Cripples, Bastards, and Broken Things", viewers: 2)
brian_kirk.episodes.create(title: "The Wolf and the Lion", viewers: 2)
alan_taylor.episodes.create(title: "Baelor", viewers: 2)
alan_taylor.episodes.create(title: "Fire and Blood", viewers: 3)
alan_taylor.episodes.create(title: "The North Remembers", viewers: 3)