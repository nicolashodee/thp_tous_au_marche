# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Producer.destroy_all

require 'faker'

20.times do
  producer = Producer.create(
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::TvShows::Simpsons.quote,
  )
end