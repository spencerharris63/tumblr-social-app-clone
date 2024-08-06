require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "validates email presence" do
    @user1 = users(:user1)
    @user1.email = nil

    assert_not @user1.valid?, "User should be invalid without an email"
  end
end