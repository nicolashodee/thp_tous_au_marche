# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Producer.destroy_all
City.destroy_all

require 'faker'

10.times do 
  City.create(
    city_name: Faker::Games::Pokemon.location,
    zip_code: Faker::Address.zip_code,
  )
end

10.times do 
  Category.create(
    product_category: Faker::Food.fruits,
  )
end

20.times do
  Producer.create(
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::GreekPhilosophers.quote,
    city: City.all[rand(0..9)],
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    website: Faker::Internet.url,
  )
end