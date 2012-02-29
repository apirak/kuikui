require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "Content is invalid" do
    message = Message.new
    assert message.invalid?
    assert message.errors[:content].any?
  end

  test "Message is valid" do
    message = Message.new
    message.content = "valid message"
    assert message.save
  end

  test "Should create tag from content" do
    message = Message.new
    message.content = "Tag is #abc #123"
    message.save
    assert_equal message.tags.join(', '), "#abc, #123"
  end

end