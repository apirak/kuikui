require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @message = messages(:one)
    @message.save
    @comment = @message.comments.new
    @comment.content = "abc"
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: @comment.attributes
    end

    assert_redirected_to message_path(@comment.message)
  end

  test "should destroy comment" do
    @comment.save
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to @comment.message
  end
end
