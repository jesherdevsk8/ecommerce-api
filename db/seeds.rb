# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

## Create admin user to development envirement

User.create(name: 'Jesher Minelli Alves', email: 'jesherdevsk8@gmail.com', password: '123123', password_confirmation: '123123', profile: 0)
