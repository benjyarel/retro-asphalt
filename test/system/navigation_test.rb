require "application_system_test_case"

class NavigationTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit "/"
    assert_selector ".banner"
  end
end
