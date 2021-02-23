# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Users
User.delete_all
User.create(email: "boris@gmail.com", password: "password")
User.create(email: "amara@gmail.com", password: "password")
User.create(email: "chris@gmail.com", password: "password")

# Bear
SPECIES = ["brown", "grizzly", "polar", "panda"]

Bear.delete_all
3.times do
  bear = Bear.create(
    species: SPECIES.sample, 
    description: Faker::Lorem.sentence(word_count: 10),
    name: Faker::Superhero.name
  )
  bear_list << bear
end

# Flats
Flat.delete_all
5.times do 
  flat = Flat.new(
    name: Faker::TvShows::Simpsons.location, 
    address: Faker::Address.street_address, 
    available: true,
    price: (5..500).to_a.sample,
    capacity: (1..10).to_a.sample
  )
  flat.bear = Bear.all.sample
  flat.user = User.all.sample
  flat.save
end
