require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Validations
  test "should not create an empty user" do
    user = User.new
    assert !user.save
  end

  test "should create a valid user" do
    user = users(:one)
    assert user.save
    assert_equal user.email, User.first.email
    assert_equal user.username, User.first.username
  end
end
