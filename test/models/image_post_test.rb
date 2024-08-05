require "test_helper"

class ImagePostTest < ActiveSupport::TestCase
  test "saves with valid attributes" do
    user = User.create!(
      name: "Test User",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
    image_post = ImagePost.new(
      title: "Test Image Post",
      url: "http://example.com/image.jpg",
      user: user
    )
    assert image_post.save
    assert_equal user.id, image_post.user_id
  end
end