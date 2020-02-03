puts "Starting Seed"

benjamin = User.create!(
  email: "benjamin@retro-asphalt.com",
  password: "password",
  first_name: "Benjamin",
  last_name: "Leray",
  )

toto = User.create!(
  email: "toto@retro-asphalt.com",
  password: "password",
  first_name: "Toto",
  last_name: "Dupont",
  )

puts "Fake Users done!"

first_car = Car.create!(
  brand: "Ford",
  model: "GT 40",
  power: 260,
  price: 175,
  year: 1956,
  user_id: 1,
  description: "Magnifique voiture, vous aurez l'impression de revoir la série Starky et Hutch et vous aurez envie de vous laisser pousser la moustache.",
  )

puts "Car done"

puts "Seed done!"
