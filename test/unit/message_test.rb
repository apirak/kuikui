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
end