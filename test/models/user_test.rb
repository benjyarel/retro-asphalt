require 'test_helper'

class UserTest < ActiveSupport::TestCase
  user = User.new(email: "toto@lewagon.com", password:"123456")

  test "A user must have a first_name and last_name" do
    assert_not user.save, "A user must have a first_name and last_name"
  end

  test "User password must be 6 character long" do
    user.update_attributes(password:"123", first_name: "toto", last_name:'dupont')
    assert_not user.save , "User password must be 6 character long"
  end

  test "A user with the right data can be saved and have picture attachment" do
    user.update_attributes(password:"123456")
    assert_not(user.save && user.picture,"A validate user can be saved." )
  end

end
