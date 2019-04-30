# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Director.destroy_all

Director.create(name: "Tim Van Patten", age: 59, city: "Brooklyn, NY, USA")
Director.create(name: "Brian Kirk", age: 50, city: "Armagh, Northern Ireland, UK")
Director.create(name: "Alan Taylor", age: 59, city: "Brooklyn, NY, USA")