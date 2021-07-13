# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mentor.create(first_name: 'Kelv', last_name: 'Gaild', email: 'k.gaild@gmail.com', time_zone: '-3')

Student.create(
  [
    {first_name: 'Ulo', last_name: 'Enyi', email: 'u.enyi@gmail.com', time_zone: '+2'},
    {first_name: 'Chi', last_name: 'Maka', email: 'c.maka@gmail.com', time_zone: '+1'}
  ]
)
