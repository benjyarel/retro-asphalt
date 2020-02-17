require "open-uri"

Car.destroy_all
User.destroy_all
Booking.destroy_all

puts "Starting Seed"
puts "Starting Fake Users"

benjamin = User.create!(email: "benjamin@retro-asphalt.com", password: "password", first_name: "Benjamin", last_name: "Leray", )

toto = User.create!(email: "toto@retro-asphalt.com", password: "password", first_name: "Toto", last_name: "Dupont", )

mc_gyver = User.create!(email: "mcgyver@retro-asphalt.com", password: "password", first_name: "Mac", last_name: "Gyver", )

puts "Fake Users done!"
puts "Starting Fake Cars"

first_car = Car.create!(
  user_id: 1,
  brand: "Ford",
  model: "GT 40",
  power: 260,
  price: 175,
  year: 1956,
  address: "13 Rue Ramus 75020 PARIS",
  description: "Magnifique voiture, vous aurez l'impression de revoir la série Starky et Hutch et vous aurez envie de vous laisser pousser la moustache.",
  )

second_car = Car.create!(
  user_id: 2,
  brand: "Ford",
  model: "Mustang",
  power: 230,
  price: 275,
  year: 1937,
  address: "10 Rue Ramus, 75020 PARIS",
  description: "On vous entendera rouler. Pneu plus larges que ton ancienne voiture.",
  )

third_car = Car.create!(
  user_id: 3,
  brand: "Jaguar",
  model: "Type-S",
  power: 230,
  price: 275,
  year: 1937,
  address: "5 Rue Oberkampf 75011 PARIS",
  description: "James Bond aurait bien aimé la conduire!",
  )

  fourth_car = Car.create!(
  user_id: 3,
  brand: "Volkswagen",
  model: "Cocinelle",
  power: 60,
  price: 90,
  year: 1949,
  address: "6 rue Sorbier 75020 PARIS",
  description: "Revivez la période hyppie. Interdit de fumer à l'intérieur",
  )
  picture_location = URI.open('app/assets/images/seed_images/vw_cocinelle.jpeg')
  fourth_car.picture.attach(io: picture_location, filename: 'vw_cocinelle', content_type: 'image/png')
  fourth_car.save
  puts "Does #{fourth_car.model} has a picture? : #{fourth_car.picture.attached?}"

  fifth_car = Car.create!(
  user_id: 2,
  brand: "Ferrari",
  model: "F-40",
  power: 310,
  price: 480,
  year: 1963,
  address: "10 rue Saint-Maur, 75011 Paris",
  description: "Vous ne serez pas serein lorsque vous ferez un créneau! Jaune possible, mais de mauvais goût",
  )

  sixth_car = Car.create!(
    user_id: 1,
    brand: "Jaguar",
    model: " XJ 220",
    power: 260,
    price: 175,
    year: 1956,
    address: "13 Rue Ramus 75020 PARIS",
    description: "Magnifique voiture, vous aurez l'impression de revoir la série Starky et Hutch et vous aurez envie de vous laisser pousser la moustache.",
    )

puts "Fake Cars done"
puts "Starting Fake Booking"

first_booking = Booking.create!(
  user_id: 2,
  car_id: 1,
  review: " It was great !!",
  starting_day:(Date.today - 1).strftime('%Y-%m-%d'),
  ending_day: (Date.today - 4).strftime('%Y-%m-%d'),
  )

first_booking = Booking.create!(
  user_id: 3,
  car_id: 6,
  review: " It was great !!",
  starting_day:(Date.today - 1).strftime('%Y-%m-%d'),
  ending_day: (Date.today - 4).strftime('%Y-%m-%d'),
  )

second_booking = Booking.create!(
  user_id: 1,
  car_id: 2,
  review: " Didn't like it, nothing to repair.",
  starting_day:(Date.today - 5).strftime('%Y-%m-%d'),
  ending_day: (Date.today - 6).strftime('%Y-%m-%d'),
  )

puts "Fake Bookings done!"
puts "Seed done!"
