# pour le format datetime des bookins --> Time.now.strftime('%Y-%m-%d')


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
  address: "10 rue des Vignolles, 75020 PARIS",
  description: "On vous entendera rouler. Pneu plus larges que ton ancienne voiture.",
  )

second_car = Car.create!(
  user_id: 3,
  brand: "Jaguar",
  model: "Type-S",
  power: 230,
  price: 275,
  year: 1937,
  address: "5 Rue Oberkampf 75011 PARIS",
  description: "James Bond aurait bien aimé la conduire!",
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

second_booking = Booking.create!(
  user_id: 3,
  car_id: 2,
  review: " Didn't like it, nothing to repair.",
  starting_day:(Date.today - 5).strftime('%Y-%m-%d'),
  ending_day: (Date.today - 6).strftime('%Y-%m-%d'),
  )

puts "Fake Bookings done!"
puts "Seed done!"
