require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "invalid comment" do
    comment = Comment.new
    assert comment.invalid?
    assert comment.errors[:message_id].any?
  end

  test "valid comment" do
    message = messages(:one)
    message.save
    comment = message.comments.new
    assert comment.valid?
    assert comment.save
  end
end
