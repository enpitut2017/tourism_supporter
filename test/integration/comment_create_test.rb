require 'test_helper'

class CommentCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @advice = advices(:one)
    @comment = @advice.comments.build(
      content: "Example Comment",
      user: @user )
    @delete_comment = comments(:one)
  end

  test "should create comment" do
    log_in_as(@user)
    get advice_path(@advice)
    post advice_comments_path(@advice, params:{comment:{content: @comment.content}}, method: :POST)
    assert @comment.save
    assert_redirected_to advice_path(@advice)
    follow_redirect!
    assert_template "advices/show"
  end

  test "should delete comment" do
    log_in_as(@user)
    get advice_path(@advice)
    delete comment_path(@delete_comment)
    assert_redirected_to advice_path(@advice)
    follow_redirect!
    assert_template "advices/show"
  end
end
