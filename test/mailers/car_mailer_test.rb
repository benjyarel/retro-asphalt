require 'test_helper'

class CarMailerTest < ActionMailer::TestCase
  test "created" do
    mail = CarMailer.created
    assert_equal "Created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
