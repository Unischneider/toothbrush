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

20.times do
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

20.times do
  toothbrush = Toothbrush.new(
    age: (1..100).to_a.sample,
    people: (0..50).to_a.sample,
    material: ["plastic", "wood", "aluminium", "gold", "silver", "others"].sample,
    brush_strength: (1..3).to_a.sample,
    price: (1..100).to_a.sample,
    user: User.all.sample,
    name: Faker::GameOfThrones.character,
    description: Faker::Lorem.paragraph,
    availability: [true, false].sample
    )
  toothbrush.remote_photo_url = "http://res.cloudinary.com/dojqtqak3/image/upload/v1519139874/#{(1..14).to_a.sample}"
  toothbrush.save
end

20.times do
  toothbrush = Toothbrush.all.sample
  days = (1..100).to_a.sample
  def random_date from = 1518490800.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end
  date = random_date
  Booking.create(
    toothbrush: toothbrush,
    user: User.all.sample,
    status: ["Pending renter request", "Pending owner validation", "Confirmed", "Canceled"].sample,
    starting_on: date.strftime("%d/%m/%Y"),
    ending_on: (date + (86400..604800).to_a.sample).strftime("%d/%m/%Y")
    )
end

10.times do
  Review.create(
    toothbrush: Toothbrush.all.sample,
    user: User.all.sample,
    content: Faker::Lorem.paragraph,
    rating: (1..10).to_a.sample
    )
end






