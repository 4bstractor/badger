require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Validations
  test "should not create an empty user" do
    user = users(:empty)
    assert !user.save
  end

  test "should create a valid user" do
    user = users(:one)
    assert user.save
    assert_equal user.email, "test@example.com"
    assert_equal user.username, "TestUser"
  end
end
