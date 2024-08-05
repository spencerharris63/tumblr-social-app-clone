require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "saves with valid attributes" do 
    user = User.create!(
      name: "Test User",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
    post = Post.new(
      title: "Test Post",
      body: "This is a test post.",
      user: user, 
      type: "Post"
    )
    assert post.save
    assert_equal user.id, post.user_id
  end
end