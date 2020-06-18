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

city_name = ['Noyal-sur-Vilaine','Vignoc','Gévezé','Boisgervilly','Guer','Langon','Créon','Saint-Sulpice-des-Landes','Roz-Landrieux','Noyal-sur-Vilaine','Laillé','Domloup','Domloup','10 Avenue des Platanes','Plumaugat','Médréac','Retiers','Gévezé','Pontorson','Rennes']
zip_code =['35530','35630','35850','35360','56380','35330','35660','35390','35390','35120','35530','35890','35410','35410','35310','22250','35360','35240','35850','50170','35000']
address =['Launay','La Rochette','7 Rue de la Fontaine','Les Hauts Grétais','832 La Touche Buis','La Bossuais du Bot',' La Dominelais','La Bellefrie','1 Rue des Plumetières','45 La Grange','11 La Corbinais','Le Bois Grosdoigt','Le Boisgrosdoigt, 14 Rue de Rennes','10 Avenue des Platanes','1 LOT DES LAURIERS','La Grande Ferrière','La Rivière au Bouenard','Lieu dit, Le Clos du Grand Chemin','Parc d activités du Mont St Michel','Atalante Champeaux']
i=0

20.times do
  Producer.create(
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::GreekPhilosophers.quote,
    address: address[i],
    city_name: city_name[i],
    zip_code: zip_code[i],
    phone_number: Faker::PhoneNumber.cell_phone,
    website: Faker::Internet.url,
  )
  i+=1
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
