# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Producer.destroy_all
Category.destroy_all
User.destroy_all

require 'faker'

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
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    website: Faker::Internet.url,
  )
end

User.create(email: 'aa@aa.com', password: 'azerty', first_name: 'John', last_name: 'Doe')

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
  )
end
