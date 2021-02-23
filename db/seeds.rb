require 'faker'

Flat.delete_all
User.delete_all
Bear.delete_all

# Users
User.create(email: "boris@gmail.com", password: "password")
User.create(email: "amara@gmail.com", password: "password")
User.create(email: "chris@gmail.com", password: "password")

# Bear
SPECIES = ["brown", "grizzly", "polar", "panda", "koala"]

5.times do
  Bear.create(
    species: SPECIES.sample, 
    description: Faker::Lorem.sentence(word_count: 10),
    name: Faker::Superhero.name
  )
end

# Flats
bears = Bear.all.to_a
5.times do 
  flat = Flat.new(
    name: Faker::TvShows::Simpsons.location, 
    address: Faker::Address.street_address, 
    available: true,
    price: (5..500).to_a.sample,
    capacity: (1..10).to_a.sample
  )
  flat.bear = bears.pop
  flat.user = User.all.sample
  flat.save

end