require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "saves with valid attributes" do
    User.transaction do
      user = User.new(
        name: "Test User",
        email: "user@example.com",
        password: "password",
        password_confirmation: "password"
      )
      assert user.save

      assert_equal 0, user.posts.count # Ensure no posts are created
      raise ActiveRecord::Rollback # Rollback the transaction to clean up the database
    end
  end
end