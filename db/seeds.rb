# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  p Faker::Name.name
  director = Director.create(
    name: Faker::Name.name
  )

  Movie.create(
    director: director,
    title: Faker::Movie.title,
    rating: Faker::Number.between(from: 0.1, to: 5.0),
  )
end