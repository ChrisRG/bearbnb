require 'faker'

puts "==[ Seeding database ]=="

puts "Deleting previous records..."
Flat.delete_all
User.delete_all
Bear.delete_all
puts "Records deleted."

# Users
puts "Seeding users..."
User.create(email: "boris@gmail.com", password: "password")
User.create(email: "amara@gmail.com", password: "password")
User.create(email: "chris@gmail.com", password: "password")
puts "Users created."

# Bear
puts "Seeding bears. This may take a moment..."
species = ["brown", "grizzly", "polar", "panda", "koala"]
BEAR_PHOTOS = {
  brown: 'app/assets/images/brown.jpg',
  grizzly: 'app/assets/images/grizzly.jpg',
  polar: 'app/assets/images/polar.jpg',
  panda: 'app/assets/images/panda.jpg',
  koala: 'app/assets/images/koala.jpg'
}

5.times do
  bear_species = species.pop
  photo_path = BEAR_PHOTOS[bear_species.to_sym]
  file = File.open(photo_path)
  bear = Bear.create(
    species: bear_species.capitalize, 
    description: Faker::Lorem.sentence(word_count: 10),
    name: Faker::Superhero.name
  )
  bear.photo.attach(io: file, filename: "#{bear_species}.jpg", content_type: "image/png")
end
puts "Bears created."

# Flats
puts "Seeding flats. This may take a moment..."
FLAT_PHOTOS = [
  'app/assets/images/brownbear-flat.jpg',
  'app/assets/images/cozy-apartment.jpg',
  'app/assets/images/chill-flat.jpg',
  'app/assets/images/Contemporary-Seattle-living-room.jpg',
  'app/assets/images/POLAR-BEAR-flat.jpg'
]

bears = Bear.all.to_a
5.times do 
  photo_path = FLAT_PHOTOS.pop
  file = File.open(photo_path)
  flat = Flat.new(
    name: Faker::TvShows::Simpsons.location, 
    address: Faker::Address.street_address, 
    available: true,
    price: (5..500).to_a.sample,
    capacity: (1..10).to_a.sample,
    description: "A great place to stay!"
  )
  flat.bear = bears.pop
  flat.user = User.all.sample
  flat.photo.attach(io: file, filename: "#{photo_path}", content_type: "image/png")
  flat.save
end
puts "Flats created. Seeding finished."

