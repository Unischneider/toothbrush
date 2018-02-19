# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Booking.destroy_all
Toothbrush.destroy_all
User.destroy_all

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.zip_code},
     #{Faker::Address.state}, #{Faker::Address.country}",
    gender: ["female", "male"].sample,
    email: Faker::Internet.email,
    password: "password123"
     )
end

100.times do
  Toothbrush.create(
    age: (1..100).to_a.sample,
    people: (0..50).to_a.sample,
    material: ["plastic", "wood", "aluminium", "gold", "silver", "others"].sample,
    brush_strength: (1..3).to_a.sample,
    price: (1..100).to_a.sample,
    user: User.all.sample,
    name: Faker::GameOfThrones.character,
    description: Faker::Lorem.sentences,
    availability: [true, false].sample,
    photo: "/assets/images/#{(1..14).to_a.sample}.jpg"
    )
end

100.times do
  toothbrush = Toothbrush.all.sample
  days = (1..100).to_a.sample
  Booking.create(
    toothbrush: toothbrush,
    days: days,
    total_price: (days * toothbrush.price),
    user: User.all.sample
    )
end

50.times do
  Review.create(
    toothbrush: Toothbrush.all.sample,
    user: User.all.sample,
    content: Faker::Lorem.sentences
    )
end






