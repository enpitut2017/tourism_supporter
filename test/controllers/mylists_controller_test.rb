require 'test_helper'

class MylistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should get mylist when users log in" do
    log_in_as(@user)
    follow_redirect!
    get user_mylists_path(@user)
    assert_response :success
  end

  test "invalid get mylist when users do not log in" do
    get user_mylists_path(@user)
    assert_redirected_to login_path
  end

end
