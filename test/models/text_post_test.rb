require "test_helper"

class TextPostTest < ActiveSupport::TestCase
  test "saves with valid attributes" do
    text_post = TextPost.new(
      body: "This is a text post",
      user: users(:user1)
    )

    assert text_post.save, "Text post should be saved with valid attributes"
  end

  test "does not save without a user" do
    text_post = TextPost.new(
      body: "This is a text post"
    )

    assert_not text_post.save, "Text post should not be saved without a user"
  end
end