require "test_helper"

class ImagePostTest < ActiveSupport::TestCase
  test "saves with valid attributes" do
    image_post = ImagePost.new(
      url: "http://example.com/image1.jpg",
      user: users(:user1)
    )

    assert image_post.save, "Image post should be saved with valid attributes"
  end

  test "does not save without a user" do
    image_post = ImagePost.new(
      url: "http://example.com/image1.jpg"
    )

    assert_not image_post.save, "Image post should not be saved without a user"
  end
end