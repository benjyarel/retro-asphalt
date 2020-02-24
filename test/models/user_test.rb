require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "A user must have a first_name and last_name" do
    user = User.new(email: "toto@lewagon.com", password:"123456")
    assert_not user.save, "A user must have a first_name and last_name"
    user.update_attributes(email: "toto@lewagon.com", password:"123456", first_name: "toto", last_name:'dupont')
    assert user.save, "A validate user can be saved."
  end

  test 'User password must be 6 character long' do
    user = User.new(email: "toto@lewagon.com", password:"123", email: "toto@lewagon.com", password:"123", first_name: "toto", last_name:'dupont')
    assert_not user.save , "User password must be 6 character long"
  end

  test "A user have an attachment for picture, when created" do
    user = User.new(email: "toto@lewagon.com", password:"123", email: "toto@lewagon.com", password:"123456", first_name: "toto", last_name:'dupont')
    assert user.picture, "User must have user.picture == true"
  end

end
