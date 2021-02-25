# For this seed we will be using:
# - faker to generate names and addresses
# - open-uri to fetch resources from Cloudinary

require 'faker'
require "open-uri"

URL_BASE = "https://res.cloudinary.com/chrisrg/image/upload/v1614178302/"

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
# Bear species are hard-coded, which also determines the image downloaded
# and the description used via the hash.
puts "Seeding bears. This may take a moment..."
species = ["brown", "grizzly", "polar", "panda", "koala"]
BEAR_PHOTOS = {
  brown: '17z81dg15frpmhrcef94avjj2zct.jpg',
  grizzly: 'gzwnp74e0uhmm5gotdi23u2emkpx.jpg',
  polar: 'jblmdwevw9kk9arw1egscvzj9pye.jpg',
  panda: 'gdxdofx0ql5a1n3f7l3hpe7rmuq5.jpg',
  koala: 'aklwptc6q9xoje1q9b3wln2yqe7m.jpg'
}

DESCRIPTIONS = {
  koala: "Loves eucalyptus leaves, hates bright colors. Fun!", 
  grizzly: "Your best friend in catching salmon and eating them raw. Delicious!", 
  panda: "Who knew sleeping 20 hours a day could be this fun? ZzZzZz!", 
  brown: "Ha ha, who knows what this one is thinking? Be careful!", 
  polar: "He might complain about the heat, but he sure knows his cars. Handy!"
}

5.times do
  bear_species = species.pop
  photo_path = "#{URL_BASE}#{BEAR_PHOTOS[bear_species.to_sym]}"
  file = URI.open(photo_path)
  bear = Bear.create(
    species: bear_species.capitalize, 
    description: DESCRIPTIONS[bear_species.to_sym],
    name: Faker::Superhero.name
  )
  bear.photo.attach(io: file, filename: "#{bear_species}.jpg", content_type: "image/png")
end
puts "Bears created."

# Flats 
# Flat images are instead generated with an array of Cloudinary URLs.
# Each path is popped off the array in order to ensure unique images.
puts "Seeding flats. This may take a moment..."
FLAT_PHOTOS = [
  '9sklkf28cw3sldecy3mviye2blop.jpg',
  'xqed9wjybdrkfiu2q5vvqzmaa1xi.jpg',
  'uh9a5yrhoich4rg1kyhomxki6m4y.jpg',
  '5zovqn6yjrfnva5mjk8txl5ur24f.jpg',
  'a6cstmi577p5i1imthr8eavhwxme.jpg'
]

FLAT_DESC = [
  'Your home away from home! Now with a bear!',
  'Enjoy the wonderful view! Absolutely no dogs!',
  'A peaceful abode -- as long as the bear is sleeping!',
  'Explore the city on foot as a real bear pursues you relentlessly!',
  'Located in a wonderfully quiet neighborhood, since most of the neighbors have long since been eaten or moved out!'
]

bears = Bear.all.to_a
5.times do 
  photo_path = "#{URL_BASE}#{FLAT_PHOTOS.pop}"
  file = URI.open(photo_path)
  flat = Flat.new(
    name: Faker::TvShows::Simpsons.location, 
    address: Faker::Address.street_address, 
    available: true,
    price: (5..500).to_a.sample,
    capacity: (1..10).to_a.sample,
    description: FLAT_DESC.pop
  )
  flat.bear = bears.pop
  flat.user = User.all.sample
  flat.photo.attach(io: file, filename: "#{photo_path}", content_type: "image/png")
  flat.save
end
puts "Flats created. Seeding finished."
