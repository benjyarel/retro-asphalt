require 'test_helper'

class CarTest < ActiveSupport::TestCase
user = User.new(first_name: "Benjamin", last_name: "Leray", email: "titi@lewagon.com", password:"123456" )
car = Car.new(user: user, address: "12 rue des Vignolles 75020 PARIS", brand: "Ford", model:"GT 40", year: 1975, description: "J'aime beaucoup cette voiture de test lol.")

test "Create a new car" do
  assert car.save
end

test "une voiture doit avoir un user obligatoirement" do
  error_car = Car.new(brand: "Toyota")
  assert car.user
  assert_not error_car.user

end


end
