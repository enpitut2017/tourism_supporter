require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micheal = users(:michael)
    @john = users(:john)
    @like = likes(:john_like)
    @advice = advices(:one)
  end

  test "valid create like" do
    log_in_as(@micheal)
    get advice_path(@advice)
    assert_difference 'Like.count', 1 do
      post advice_likes_path(@advice), xhr: true
    end
    assert_response :success
  end

  test "invalid create like without login" do
    get advice_path(@advice)
    assert_no_difference 'Like.count' do
      post advice_likes_path(@advice), xhr: true
    end
    assert_response :success
  end

  test "invalid create like with duplication like" do
    log_in_as(@john)
    get advice_path(@advice)
    assert_no_difference 'Like.count' do
      post advice_likes_path(@advice), xhr: true
    end
    assert_response :success
  end

  test "valid destroy like" do
    log_in_as(@john)
    get advice_path(@advice)
    assert_difference 'Like.count', -1 do
      delete like_path(@like), xhr: true
    end
    assert_response :success
  end

  test "invalid destroy like without login" do
    get advice_path(@advice)
    assert_no_difference 'Like.count' do
      delete like_path(@like), xhr: true
    end
    assert_response :success
  end

  test "invalid destroy like with other user" do
    log_in_as(@micheal)
    get advice_path(@advice)
    assert_no_difference 'Like.count' do
      delete like_path(@like), xhr: true
    end
    assert_response :success
  end
end
