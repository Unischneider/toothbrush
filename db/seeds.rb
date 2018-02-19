# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.zip_code},
     #{Faker::Address.state}, #{Faker::Address.countrx}",
    gender: ["female", "male"].sample,
    email: Faker::Internet.email,
    password: "password123"
     )
end

100.times do
  Toothbrush.create(
    age: [1..100].sample,
    people: [0..50].sample,
    material: ["plastic", "wood", "aluminium", "gold", "silver", "others"].sample,
    brush_strength: [1..3].sample,
    price: [1..100].sample,
    user: User.all.sample.id

    )
end

100.times do

end

